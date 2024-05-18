//
//  MainCard.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/9/24.
//

import SwiftUI

struct MainCard: View {
    @State var imageUrl: String = ""
    @State var headerPill: String
    @State var subTitle: String
    @State var title: String
    @State var price: String
    @State var category: String
    
    
    var body: some View {
        
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(headerPill)
                        .fontWeight(.black)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .background {
                            Capsule().fill(.white)
                        }
                    
                    Text(subTitle)
                        .font(.callout)
                    
                    Text(title)
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text(price)
                    
                    Text(category)
                        .font(.callout)
                        .fontWeight(.bold)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 2)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.primary, lineWidth: 1.0))
                    
                }
                .frame(width: 200, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 5) {
                    AsyncImage(url: URL(string: imageUrl)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 180)
            .background {
                RoundedRectangle(cornerRadius: 15).fill(Color.orange)
            }
        .padding(5)
        }
}

#Preview {
    MainCard(headerPill: "Summer", subTitle: "Tops", title: "Cablehut Beach", price: "$49.50", category: "Hoodie")
}
