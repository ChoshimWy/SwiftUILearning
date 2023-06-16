//
//  DrawerCloseButton.swift
//  NavigatorDrawer
//
//  Created by Choshim.Wei on 2023/6/16.
//

import SwiftUI

struct DrawerCloseButton: View {
    @EnvironmentObject var viewModel: DrawerViewModel
    var animation: Namespace.ID
    
    var body: some View {
        Button {
            withAnimation(.easeInOut) {
                viewModel.showDrawer.toggle()
            }
        } label: {
            Image(systemName: viewModel.showDrawer ? "chevron.backward":"list.bullet")
                .frame(width: 36, height: 36)
                .font(.title2)
                .foregroundColor(viewModel.showDrawer ? .white:.black)
        }
        .matchedGeometryEffect(id: "CLOSEBUTTON", in: animation)
    }
}
