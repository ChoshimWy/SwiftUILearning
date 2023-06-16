//
//  DrawerViewModel.swift
//  NavigatorDrawer
//
//  Created by Choshim.Wei on 2023/6/16.
//

import SwiftUI

class DrawerViewModel: ObservableObject {
    
    @Published var selectedButton = "house"
    
    @Published var showDrawer = false
}

