//
//  HeaderViewModel.swift
//  AnimatedHeader
//
//  Created by Choshim.Wei on 2023/6/7.
//

import SwiftUI

class HeaderViewModel: ObservableObject {
    
    @Published var startMinY: CGFloat = 0
    
    @Published var offset: CGFloat = 0
    
    @Published var headerOffset: CGFloat = 0
    
    @Published var topScrollOffset: CGFloat = 0
    
    @Published var bottomScrollOffset: CGFloat = 0
}
