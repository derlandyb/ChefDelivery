//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Derlandy Belchior on 09/06/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimating = false
    @State private var imageOffset: CGSize = .zero
    @State private var buttonOffset: CGFloat = 0
    @State private var showContentView = false
    
    private var buttonHeight: CGFloat = 80
    
    private var circleFrameWidthX: CGFloat {
        return isAnimating ? 200 : 0
    }
    
    private var circleOpacity: CGFloat {
        return isAnimating ? 0.5 : 0
    }
    
    private var circleTopPositionX: CGFloat {
        return isAnimating ? 50 : -50
    }
    
    private var circleTopPositionY: CGFloat {
        return isAnimating ? 100 : -100
    }
    
    private var imagePadding: CGFloat {
        return isAnimating ? 32 : 92
    }
    
    private func circleBottomPosition(size: CGFloat) -> CGFloat {
        return isAnimating ? size - 50 : size + 50
    }
    
    private var circleBlurRadios: CGFloat = 60
    
    private var animattedButtonWidth = 0
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                BackgroundCircleView(width: circleFrameWidthX, positionX: circleTopPositionX, positionY: circleTopPositionY, radius: circleBlurRadios, opacity: circleOpacity, color: Color("ColorRed"))
                
                BackgroundCircleView(width: circleFrameWidthX, positionX: circleBottomPosition(size: geometry.size.width), positionY: circleBottomPosition(size: geometry.size.height), radius: circleBlurRadios, opacity: circleOpacity, color: Color("ColorRedDark"))
                
                
                VStack {
                    
                    HomeHeaderView(textTitleOpacity: isAnimating ? 1 : 0.5, textDescriptionOpacity: isAnimating ? 1 : 0, textTitleOffsetY: isAnimating ? 0 : -40, textDescriptionOffsetY: isAnimating ? 0 : -40)
                    
                    HomeFeaturedImageView(imagePadding: imagePadding)
                    
                    HomeAnimattedButtonView(offsetY: isAnimating ? 0 : 200, opacity: isAnimating ? 1 : 0) {
                        showContentView = true
                    }
                    .padding(.horizontal, 24)
                    .frame(height: 80)
                    
                }
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        isAnimating = true
                    }
                }
                .fullScreenCover(isPresented: $showContentView, content: {
                    ContentView()
                })
            }
        }
    }
}

#Preview {
    HomeView()
}
