//
//  HomeFeaturedImageView.swift
//  ChefDelivery
//
//  Created by Derlandy Belchior on 10/06/24.
//

import SwiftUI

struct HomeFeaturedImageView: View {
    @State private var imageOffset: CGSize = .zero
    var imagePadding: CGFloat
    
    var body: some View {
        Image("image")
            .resizable()
            .scaledToFit()
            .shadow(radius: 60)
            .padding(imagePadding)
            .offset(
                x: imageOffset.width,
                y: imageOffset.height
            )
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        withAnimation(.easeInOut(duration: 0.5)) {
                            imageOffset = gesture.translation
                        }
                    }
                    .onEnded({ _ in
                        withAnimation(.easeInOut(duration: 0.5)) {
                            imageOffset = .zero
                        }
                    }
                )
            )
    }
}

#Preview {
    HomeFeaturedImageView(imagePadding: 32)
}
