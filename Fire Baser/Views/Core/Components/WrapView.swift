//
//  WrapView.swift
//  Fire Baser
//
//  Created by SEAN BLAKE on 5/13/24.
//

import SwiftUI

struct WrapView: View {
    let items: [String]
    @Binding var selectedItems: Set<String>
    
    @State private var totalHeight = CGFloat.zero       // Cumulative height of the view
    
    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
    }
    
    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        var lastHeight = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(self.items, id: \.self) { item in
                self.item(for: item)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading) { d in
                        if (abs(width - d.width) > geometry.size.width) {
                            width = 0
                            height -= lastHeight
                        }
                        let result = width
                        if item == self.items.last {
                            width = 0 // last item
                        } else {
                            width -= d.width
                        }
                        return result
                    }
                    .alignmentGuide(.top) { d in
                        let result = height
                        lastHeight = d.height
                        return result
                    }
            }
        }
        .background(viewHeightReader($totalHeight))
    }
    
    private func item(for text: String) -> some View {
        Button(action: {
            if selectedItems.contains(text) {
                selectedItems.remove(text)
            } else {
                selectedItems.insert(text)
            }
        }) {
            Text(text)
                .padding(.all, 8)
                .background(selectedItems.contains(text) ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
    
    private func viewHeightReader(_ height: Binding<CGFloat>) -> some View {
        GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                height.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

struct WrapView_Previews: PreviewProvider {
    static var previews: some View {
        WrapView(items: ["Apple", "Banana", "Cherry", "Date", "Elderberry", "Fig", "Grapes"], selectedItems: .constant(Set(["Banana", "Fig"])))
            .frame(width: 300, height: 200)
    }
}
