//
//  StoreContainerView.swift
//  ChefDelivery
//
//  Created by Derlandy Belchior on 06/06/24.
//

import SwiftUI

struct StoreContainerView: View {
    
    let title = "Lojas"
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 30) {
                ForEach(storesMock) { mock in
                    NavigationLink {
                        StoreDetailView(store: mock)
                    } label: {
                        StoreItemView(store: mock)
                    }
                }
            }
            .foregroundColor(.black)
            
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    StoreContainerView()
}
