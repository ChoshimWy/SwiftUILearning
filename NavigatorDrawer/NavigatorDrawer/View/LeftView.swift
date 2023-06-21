//
//  LeftView.swift
//  NavigatorDrawer
//
//  Created by Choshim.Wei on 2023/6/19.
//

import SwiftUI

struct LeftView: View {
    
    private var items = ["house", "bookmark1", "message2", "person"]
    private var action: (String) -> Void
    
    init(action: @escaping (String) -> Void) {
        self.action = action
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Color.orange
                .frame(height: 200)
        
            List(items, id: \.self) { item in
                VStack {
                    Text("Row index \(item)")
                }
                .listRowBackground(
                    Color.red
                )
                .onTapGesture {
                    print("Tapped index:\(item)")
                    withAnimation(.easeInOut) {
                        action(item)
                    }
                }
            }
            .listStyle(PlainListStyle())
        
            Color.black
                .frame(height: 40)
        }
    }
}

struct LeftView_Previews: PreviewProvider {
    static var previews: some View {
        LeftView { _ in
            
        }
    }
}
