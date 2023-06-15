//
//  ContentView.swift
//  CurvedTabBar
//
//  Created by Choshim.Wei on 2023/6/13.
//

import SwiftUI

struct ContentView: View {
    @State var selected = "house"
    private var items = ["house", "bookmark", "message", "person"]
    
    @State var isHiddenTabBar = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            /// 内容子视图
            TabView(selection: $selected) {
                HouseView()
                    .tag(items[0])
//                    .tabItem {
//                        Label("house", systemImage: "house")
//                    }
                
                BookmarkView()
                    .tag(items[1])
//                    .tabItem {
//                        Label("bookmark", systemImage: "bookmark")
//                    }
                
                MessageView()
                    .tag(items[2])
//                    .tabItem {
//                        Label("message", systemImage: "message")
//                    }
                
                PersonView()
                    .tag(items[3])
//                    .badge(2)
//                    .tabItem {
//                        Label("person", systemImage: "person")
//                    }
            }
            .background(Color.white)
            .foregroundColor(Color.white)
            .ignoresSafeArea()
            
            /// 自定义TabBar
            CurveTabBar(selected: $selected, items: items)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

