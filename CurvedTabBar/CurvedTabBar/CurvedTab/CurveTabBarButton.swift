//
//  CurveTabBarButton.swift
//  CurvedTabBar
//
//  Created by Choshim.Wei on 2023/6/14.
//

import SwiftUI

struct CurveTabBarButton: View {
    
    var image: String
    @Binding var selected: String
    @Binding var tabPoints: [CGFloat]
    
    var body: some View {
        GeometryReader { proxy -> AnyView in
            let midX = proxy.frame(in: .global).midX
            print("--- \(midX) -- \(proxy.frame(in: .global))")
            DispatchQueue.main.async {
                if tabPoints.count <= 4 {
                    tabPoints.append(midX)
                }
            }
            
            return AnyView(
                Button(action: {
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)) {
                        selected = image
                    }
                }, label: {
                    //                    Image(systemName: "\(image)\(selected == image ? ".fill":"")")
                    Image(systemName: "\(image)")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(selected == image ? Color.orange:Color.gray)
                        .offset(y: selected == image ? -10:0)
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        }
        .frame(height: 40)
    }
}
