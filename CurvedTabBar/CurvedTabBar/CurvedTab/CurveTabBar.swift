//
//  CurveTabBar.swift
//  CurvedTabBar
//
//  Created by Choshim.Wei on 2023/6/14.
//

import SwiftUI

struct CurveTabBar: View {
    
    @Binding var selected: String
    
    @State var tabPoints: [CGFloat] = []
    
    var backgroudColor: Color = Color.white
    
    var items: [String]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(items, id: \.self) { tab in
                CurveTabBarButton(image: tab, selected: $selected, tabPoints: $tabPoints)
            }
        }
        .padding()
        .background(
            backgroudColor
                .clipShape(TabCurveShape(tabPoint: curvePoint - 15))
        )
        .overlay(
            Circle()
                .fill(backgroudColor)
                .frame(width: 10, height: 10)
                .offset(x: curvePoint - 20)
            , alignment: .bottomLeading
        )
        .cornerRadius(30)
        .padding(.horizontal)
    }
    
    var curvePoint: CGFloat {
        if tabPoints.isEmpty {
            return 10
        } else {
            let index = items.firstIndex(of: selected) ?? 0
            return tabPoints[index]
        }
    }
}
