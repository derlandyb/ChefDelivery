//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Derlandy Belchior on 06/06/24.
//

import SwiftUI

struct StoreItemView: View {
    let order: OrderType
    var body: some View {
        HStack {
            Image(order.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
            Text(order.name)
                .font(.subheadline)
            Spacer()
        }
    }
}

#Preview {
    StoreItemView(
        order: OrderType(id: 1, name: "Monstro Burguer", image: "monstro-burger-logo")
    )
    .previewLayout(.sizeThatFits)
}
