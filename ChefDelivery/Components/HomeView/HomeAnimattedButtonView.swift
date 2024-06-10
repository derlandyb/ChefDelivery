//
//  HomeAnimattedButtonView.swift
//  ChefDelivery
//
//  Created by Derlandy Belchior on 10/06/24.
//

import SwiftUI

struct HomeAnimattedButtonView: View {
    
    var offsetY: CGFloat
    
    var opacity: CGFloat
    
    var action: () -> Void
    
    var buttonHeight: CGFloat = 80
    
    @State private var buttonOffset: CGFloat = 0
    
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack(alignment: .center) {
                Capsule()
                    .fill(Color("ColorRed").opacity(0.2))
                Capsule()
                    .fill(Color("ColorRed").opacity(0.2))
                    .padding(8)
                
                Text("Descubra mais")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color("ColorRedDark"))
                    .offset(x: 20)
                
                HStack {
                    Capsule()
                        .fill(Color("ColorRed"))
                        .frame(width: buttonOffset + buttonHeight)
                    
                    Spacer()
                }
                
                HStack {
                    
                    ZStack {
                        Circle()
                            .fill(Color("ColorRed"))
                        
                        Circle()
                            .fill(Color("ColorRedDark"))
                            .padding(8)
                        
                        Image(systemName: "chevron.right.2")
                            .font(.system(size: 24))
                            .bold()
                            .foregroundColor(.white)
                    }
                    .offset(x: buttonOffset)
                    
                    Spacer()
                }
                .gesture(
                    DragGesture()
                        .onChanged(
                            { gesture in
                                if gesture.translation.width >= 0 && buttonOffset <= (geometry.size.width) - buttonHeight {
                                    buttonOffset = gesture.translation.width
                                }
                            }
                      )
                        .onEnded({ _ in
                            
                            if buttonOffset > (geometry.size.width) / 2 {
                                action()
                            } else {
                                withAnimation(.easeInOut(duration: 0.25)) {
                                    buttonOffset = 0
                                }
                            }
                            
                        })
                )
            }
            .frame(width: geometry.size.width, height: buttonHeight)
            .offset(y: offsetY)
            .opacity(opacity)
        }.padding(.horizontal, 8)
    }
}

#Preview {
    HomeAnimattedButtonView(offsetY: 200, opacity: 1, action: {})
}
