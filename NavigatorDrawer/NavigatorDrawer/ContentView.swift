//
//  ContentView.swift
//  NavigatorDrawer
//
//  Created by Choshim.Wei on 2023/6/16.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = DrawerViewModel()
    @Namespace var animation
    
    private var items = ["house", "bookmark", "message", "person"]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Drawer(animation: animation)
            ZStack {
                NavigationView {
                    VStack {
                        TabView(selection: $viewModel.selectedButton) {
                            CatalogueView()
                                .tag(items[0])
                            
                            OrdersView()
                                .tag(items[1])
                            
                            FavouritesView()
                                .tag(items[2])
                            
                            MineView()
                                .tag(items[3])
                        }
                        .navigationTitle(viewModel.selectedButton)
                        .navigationBarTitleDisplayMode(.automatic)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    withAnimation(.easeOut) {
                                        viewModel.showDrawer.toggle()
                                    }
                                } label: {
                                    Image(systemName: "list.bullet")
                                        .foregroundColor(.black)
                                        .frame(width: 24, height: 24)
                                }
                                
                            }
                        }
                        .ignoresSafeArea()
                        
                        CurveTabBar(selected: $viewModel.selectedButton, items: items)
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                
                /// 半透明遮罩
                Color.black.opacity(viewModel.showDrawer ? 0.5:0)
                    .frame(width: UIScreen.main.bounds.width)
                    .ignoresSafeArea(.all)
                    .onTapGesture {
                        withAnimation(.easeOut) {
                            viewModel.showDrawer.toggle()
                        }
                    }
            }
            
        }
        .frame(width: UIScreen.main.bounds.width)
        .offset(x: viewModel.showDrawer ? 125:-125)
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NavigationViewStyle: ViewModifier {
    @EnvironmentObject var viewModel: DrawerViewModel
    
    func body(content: Content) -> some View {
        NavigationView {
            content
                .navigationTitle(viewModel.selectedButton)
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            withAnimation(.easeOut) {
                                viewModel.showDrawer.toggle()
                            }
                        } label: {
                            Image(systemName: "list.bullet")
                                .foregroundColor(.black)
                                .frame(width: 24, height: 24)
                        }
                        
                    }
                }
        }
    }
}
