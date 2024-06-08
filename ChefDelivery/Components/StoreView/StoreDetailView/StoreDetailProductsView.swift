//
//  StoreDetailProductsView.swift
//  ChefDelivery
//
//  Created by Derlandy Belchior on 08/06/24.
//

import SwiftUI

struct StoreDetailProductsView: View {
    
    let products: [ProductType]
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Produtos")
                .font(.title2)
                .bold()
                .padding()
            
            ForEach(products) { product in
                Button {
                    selectedProduct = product
                } label: {
                    StoreDetailProductItemView(product: product)
                        .sheet(item: $selectedProduct) { product in
                            ProductDetailView(product: product)
                        }
                }
            }
        }
    }
}

#Preview {
    StoreDetailProductsView(products: storesMock[0].products)
}
