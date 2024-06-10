//
//  HomeHeaderView.swift
//  ChefDelivery
//
//  Created by Derlandy Belchior on 10/06/24.
//

import SwiftUI

struct HomeHeaderView: View {
    var textTitleOpacity: CGFloat
    var textDescriptionOpacity: CGFloat
    var textTitleOffsetY: CGFloat
    var textDescriptionOffsetY: CGFloat
    var body: some View {
        VStack {
            Text("Chef Delivery")
                .font(.system(size: 48))
                .fontWeight(.heavy)
                .foregroundColor(Color("ColorRed"))
                .opacity(textTitleOpacity)
                .offset(y: textTitleOffsetY)
            
            Text("Peça as suas comidas favoritas no conforto de sua casa.")
                .font(.title2)
                .padding()
                .multilineTextAlignment(.center)
                .foregroundColor(.black.opacity(0.5))
                .opacity(textDescriptionOpacity)
                .offset(y: textDescriptionOffsetY)
        }
    }
}

#Preview {
    HomeHeaderView(textTitleOpacity: 1, textDescriptionOpacity: 1, textTitleOffsetY: 0, textDescriptionOffsetY: 0)
}
