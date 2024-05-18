////
////  AddProductView.swift
////  Fire Baser
////
////  Created by SEAN BLAKE on 5/4/24.
////
//
//import SwiftUI
//
//struct AddProductView: View {
//    @Environment(\.dismiss) var dismiss
//    @State private var selectedImages: [UIImage] = []
//    @State private var isShowingImagePicker = false
//    @State private var isUploading = false
//    @State private var uploadSuccess = false
//    @State private var errorMessage: String?
//    
//    // For the text fields
//    @State private var title = ""
//    @State private var price = ""
//    @State private var description = ""
//    
//    let maxImages = 8
//    
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                VStack(alignment: .leading, spacing: 15) {
//                    // MARK: - Image Section
//                    VStack(alignment: .center) {
//                        ImageButton {
//                            if selectedImages.count < maxImages {
//                                isShowingImagePicker.toggle()
//                            }
//                        }
//                        .sheet(isPresented: $isShowingImagePicker) {
//                            MultipleImagePicker(images: $selectedImages)
//                        }
//                        
//                        if !selectedImages.isEmpty {
//                            ScrollView(.horizontal, showsIndicators: false) {
//                                HStack {
//                                    ForEach(selectedImages, id: \.self) { img in
//                                        Image(uiImage: img)
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(width: 150, height: 150)
//                                            .cornerRadius(5)
//                                    }
//                                }
//                            }
//                        }
//                    }
//                    .frame(maxWidth: .infinity)
//
//                    
//                    CustomTextField(placeholder: "Title", text: $title)
//                    
//                    VStack(alignment: .leading, spacing: 1) {
//                        Text("Description")
//                        TextEditor(text: $description)
//                            .lineLimit(2)
//                            .frame(height: 100)
//                            .padding(4)
//                        .background(RoundedRectangle(cornerRadius: 15).stroke().fill(Color.gray))
//                    }
//                    
//                    // MARK: - Category
//                    // Category Selector
//                    Text("Choose a category")
//                    CategorySelectionSection()
//                    
//                    CustomTextField(placeholder: "Price", text: $price)
//                    
//    //                SortingSection()
//    //                CategorySelectionSection()
//    //                IngredientsSelectionSection()
//    //                ShowResultsButton()
//                    
//                    // MARK: - Upload button
//                    // Upload Button
//                    CustomButton(action: {
//                        uploadImages()
//                    }, text: "Upload", buttonColor: Color.green)
//                    .disabled(isUploading)
//                    
//                    if isUploading {
//                        ProgressView()
//                            .progressViewStyle(.circular)
//                    }
//                    
//                    if uploadSuccess {
//                        Text("Images uploaded successfully!")
//                            .foregroundColor(.green)
//                    }
//                    
//                    if let errorMessage = errorMessage {
//                        Text(errorMessage)
//                            .foregroundColor(.red)
//                    }
//                }
//                .padding(.horizontal)
//                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//                .navigationBarBackButtonHidden(true)
//                .navigationTitle("Add Product")
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    ToolbarItem(placement: .topBarTrailing) {
//                        Button{ dismiss() } label: {Text("Cancel")}
//                    }
//            }
//            }
//        }
//    }
//    
//    private func uploadImages() {
//        isUploading = true
//        FirebaseManager.shared.uploadImages(productImages: selectedImages) { result in
//            isUploading = false
//            switch result {
//            case .success(let urls):
//                if let firstImageUrl = urls.first {
//                    FirebaseManager.shared.addItem(
//                        productID: "someID",
//                        productTitle: "Title",
//                        productDescription: "Description",
//                        productCategory: "Category",
//                        productPrice: 10.99,
//                        productSizes: ["M": 10],
//                        productColors: ["Red": 5],
//                        firstImageUrl: firstImageUrl) { success, error in
//                        if success {
//                            uploadSuccess = true
//                            print("Product and image successfully added!")
//                        } else {
//                            errorMessage = "Failed to add product: \(error?.localizedDescription ?? "Unknown error")"
//                        }
//                    }
//                }
//            case .failure(let error):
//                errorMessage = "Failed to upload images: \(error.localizedDescription)"
//            }
//        }
//    }
//}
//
//
//#Preview {
//    AddProductView()
//}
