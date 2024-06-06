//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Derlandy Belchior on 06/06/24.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            NavigationBar()
                .padding(.horizontal, 15)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    OrderTypeGridView()
                    CarouselTabView()
                    StoreContainerView()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .previewLayout(.sizeThatFits)
}
