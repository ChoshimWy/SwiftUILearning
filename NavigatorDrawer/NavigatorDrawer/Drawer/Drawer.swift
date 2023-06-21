//
//  Drawer.swift
//  NavigatorDrawer
//
//  Created by Choshim.Wei on 2023/6/16.
//

import SwiftUI

struct Drawer<Content: View>: View {
    
    private let content: () -> Content
    private let width: CGFloat
    
    init(width: CGFloat = 250, @ViewBuilder content: @escaping () -> Content) {
        self.width = width
        self.content = content
    }
    
    var body: some View {
        VStack {
            content()
        }
        .frame(width: width)
    }
}

