//
//  FirebaseManager.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/5/24.
//

import Foundation
import Firebase
import FirebaseStorage

class FirebaseManager {
    static let shared = FirebaseManager()
    let db = Firestore.firestore()
    let storage = Storage.storage()
    
    // Modify addItem function to include firstImageUrl parameter
    func addItem(productID: String, productTitle: String, productDescription: String, productCategory: String, productPrice: Double, productSizes: [String: Int], productColors: [String: Int], firstImageUrl: String, completion: @escaping (Bool, Error?) -> Void) {
        db.collection("products").document(productID).setData([
            "productID": productID,
            "productTitle": productTitle,
            "productDescription": productDescription,
            "productCategory": productCategory,
            "productPrice": productPrice,
            "productSizes": productSizes,
            "productColors": productColors,
            "firstImage": firstImageUrl  // Adding the first image URL
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
                completion(false, err)
            } else {
                print("Document added with ID: \(productID)")
                completion(true, nil)
            }
        }
    }
    
    // New function to upload multiple images
    // Update the uploadImages function to return an ordered list of URLs
    func uploadImages(productImages: [UIImage], completion: @escaping (Result<[String], Error>) -> Void) {
        var uploadedURLs: [String] = []
        let group = DispatchGroup()
        
        for image in productImages {
            guard let imageData = image.jpegData(compressionQuality: 0.8) else {
                continue  // Consider handling this error more explicitly if necessary
            }
            
            group.enter()
            let storageRef = storage.reference()
            let imageRef = storageRef.child("productImages/\(UUID().uuidString).jpg")
            
            imageRef.putData(imageData, metadata: nil) { metadata, error in
                if let error = error {
                    completion(.failure(error))
                    group.leave()
                    return
                }
                imageRef.downloadURL { (url, error) in
                    if let error = error {
                        completion(.failure(error))
                        group.leave()
                        return
                    } else if let url = url {
                        uploadedURLs.append(url.absoluteString)
                        group.leave()
                    }
                }
            }
        }
        
        group.notify(queue: .main) {
            completion(.success(uploadedURLs))
        }
    }

    
    // Function to fetch all inventory items
    func fetchInventory(completion: @escaping (Result<[Product], Error>) -> Void) {
            db.collection("products").getDocuments { (querySnapshot, err) in
                if let err = err {
                    completion(.failure(err))
                } else if let querySnapshot = querySnapshot {
                    var products = [Product]()
                    for document in querySnapshot.documents {
                        if let product = Product(dictionary: document.data()) {
                            products.append(product)
                        }
                    }
                    completion(.success(products))
                }
            }
        }
    
}
