//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by Derlandy Belchior on 06/06/24.
//

import SwiftUI

struct CarouselTabView: View {
    
    
    let ordersMock: [OrderType] = [
        OrderType(id: 1, name: "Barbecue Banner", image: "barbecue-banner"),
        OrderType(id: 2, name: "Prato Feito", image: "brazilian-meal-banner"),
        OrderType(id: 3, name: "Poke Banner", image: "pokes-banner"),
    ]
    
    var body: some View {
        TabView {
            ForEach(ordersMock) { mock in
                    CarouselItemView(order: mock)
            }
        }.frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    CarouselTabView()
}
