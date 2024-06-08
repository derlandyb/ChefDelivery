//
//  ProductDetailQuantityView.swift
//  ChefDelivery
//
//  Created by Derlandy Belchior on 08/06/24.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    
    @Binding var productQuantity: Int
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Quantidade")
                .font(.title3)
                .bold()
            
            HStack {
                Button(action: {
                    if productQuantity > 1 {
                        productQuantity -= 1
                    }
                    
                }, label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("ColorRed"))
                })
                
                Text("\(productQuantity)")
                    .font(.title2)
                    .bold()
                    .frame(width: 30, height: 20)
                
                Button(action: {
                    productQuantity += 1
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("ColorRed"))
                })
            }
        }
    }
}

#Preview {
    ProductDetailQuantityView(productQuantity: .constant(1))
}
