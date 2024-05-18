//
//  Dashboard.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/3/24.
//

import SwiftUI

struct Dashboard: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var products: [Product] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    var body: some View {
            NavigationStack {
                VStack {
                    Navigator()
                        .padding(.top, -60)
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text("Welcome")
//                                .font(.headline)
//                                .fontWeight(.bold)
//                            Text("\(authManager.currentUserEmail ?? "Guest")")
//                        }
//                        Spacer()
//                    }
//                    
                    if isLoading {
                        ProgressView()
                    } else if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    } else {
                        ScrollView {
                            TabView {
                                ForEach(products, id: \.productID) { product in
                                    MainCard(imageUrl: product.imageUrl, headerPill: "Summer", subTitle: product.productDescription, title: product.productTitle, price: "$19.99", category: product.productCategory)
                                        .padding(.top, -10)
                                }
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                            .frame(height: 250)
                        }
                        .refreshable {
                            fetchProducts()
                        }
                    }
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .background(Color.black)
                .navigationBarBackButtonHidden(true)
            }
            .onAppear {
                fetchProducts()
            }
        }
    
    private func fetchProducts() {
        isLoading = true
        errorMessage = nil  // Clear previous errors
        FirebaseManager.shared.fetchInventory { result in
            isLoading = false
            switch result {
            case .success(let products):
                self.products = products
            case .failure(let error):
                errorMessage = "Failed to load data: \(error.localizedDescription)"
            }
        }
    }
}

#Preview {
    Dashboard()
        .environmentObject(AuthManager())
}
