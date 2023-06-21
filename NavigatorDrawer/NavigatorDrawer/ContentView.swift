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
    @State private var showDetailModal = false
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Drawer(width: 250) {
                LeftView { item in
                    if (viewModel.items.contains(item)) {
                        viewModel.selectedButton = item;
                    } else {
                       showDetailModal = true
                    }
                    viewModel.showDrawer.toggle()
                }
            }
            
            ZStack {
                NavigationView {
                    VStack {
                        TabView(selection: $viewModel.selectedButton) {
                            CatalogueView()
                                .tag(viewModel.items[0])
                            
                            OrdersView()
                                .tag(viewModel.items[1])
                            
                            FavouritesView()
                                .tag(viewModel.items[2])
                            
                            MineView()
                                .tag(viewModel.items[3])
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
//                        .ignoresSafeArea()
                        
                        CurveTabBar(selected: $viewModel.selectedButton, items: viewModel.items)
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .fullScreenCover(isPresented: $showDetailModal) {
                    DetailView()
                }
                
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
        .offset(x: viewModel.showDrawer ? 125:-125)
//        .gesture(
//            DragGesture()
//                .onChanged({ value in
//                    print("\(value.translation)")
//                })
//        )
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
