//
//  DrawerButton.swift
//  NavigatorDrawer
//
//  Created by Choshim.Wei on 2023/6/16.
//

import SwiftUI

struct DrawerButton: View {
    
    var name: String
    
    var image: String
    
    @Binding var selectedButton: String
    
    var animation: Namespace.ID
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                selectedButton = name
            }
        } label: {
            HStack(spacing: 15) {
                Image(systemName: image)
                    .resizable()
                    .font(.title2)
                    .foregroundColor(selectedButton == name ? .black:.white)
                
                Text(name)
                    .foregroundColor(selectedButton == name ? .black:.white)
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            .frame(width: 200, alignment: .leading)
            .background(
                ZStack {
                    if selectedButton == name {
                        Color.white
                            .cornerRadius(10)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    } else {
                        Color.clear
                    }
                }
            )
        }

    }
}


