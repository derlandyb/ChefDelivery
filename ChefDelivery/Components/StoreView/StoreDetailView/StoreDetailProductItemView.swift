//
//  StoreDetailProductItemView.swift
//  ChefDelivery
//
//  Created by Derlandy Belchior on 08/06/24.
//

import SwiftUI

struct StoreDetailProductItemView: View {
    let product: ProductType
    
    var body: some View {
        
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.name)
                        .bold()
                    Text(product.description)
                        .multilineTextAlignment(.leading)
                    
                    Text(product.formattedPrice)
                }
                
                Spacer()
                
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                    .frame(width: 120, height: 120)
                    .shadow(color: .black.opacity(0.3), radius: 20, x: 6, y: 8)
            }
            .padding()
            .foregroundColor(.black)
    }
}

#Preview {
    StoreDetailProductItemView(product: storesMock[0].products[0])
}
