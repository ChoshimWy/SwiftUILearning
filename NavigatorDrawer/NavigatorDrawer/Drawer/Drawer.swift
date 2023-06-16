//
//  Drawer.swift
//  NavigatorDrawer
//
//  Created by Choshim.Wei on 2023/6/16.
//

import SwiftUI

struct Drawer: View {
    
    @EnvironmentObject var viewModel: DrawerViewModel
    
    var animation: Namespace.ID
    
    var body: some View {
        VStack {
            Color.orange
                .ignoresSafeArea(.all)
        }
        .frame(width: 250)
        .background(
            Color.orange
                .ignoresSafeArea(.all, edges: .vertical)
        )
    }
}

