//
//  BackgroundCircleView.swift
//  ChefDelivery
//
//  Created by Derlandy Belchior on 10/06/24.
//

import SwiftUI

struct BackgroundCircleView: View {
    var width: CGFloat
    var positionX, positionY, radius, opacity: CGFloat
    var color: Color
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: width)
            .position(x: positionX, y: positionY)
            .blur(radius: radius)
            .opacity(opacity)
    }
}

#Preview {
    BackgroundCircleView(width: 200, positionX: 50, positionY: 50, radius: 60, opacity: 0.6, color: Color("ColorRed"))
}
