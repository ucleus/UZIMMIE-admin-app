//
//  Navigator.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/8/24.
//

import SwiftUI

struct Navigator: View {
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            HStack {
                // Add product button
                NavigationLink {
                    AddProductView()
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(Color.primary)
                        .padding()
                        .frame(width: 40, height: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.primary, lineWidth: 1.0))
                }
                
                Spacer()
                // Title
                Text("Dashboard")
                    .font(.title2.bold())
                    .foregroundStyle(Color.primary )
                
                Spacer()
                // Search button
                IconButton(action: {}, icon: "magnifyingglass")
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 123)
        .background {
            RoundedRectangle(cornerRadius: 15).fill(Color("LightGray"))
        }
        .padding(5)
    }
}

#Preview {
    Navigator()
}
