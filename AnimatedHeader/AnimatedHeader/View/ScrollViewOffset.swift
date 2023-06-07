//
//  ScrollViewOffset.swift
//  AnimatedHeader
//
//  Created by Choshim.Wei on 2023/6/7.
//

import SwiftUI

/// ScrollView视图滚动监听
struct ScrollViewOffset<Content: View>: View {
    private let content: () -> Content
    private let onOffsetChanged:(CGFloat) -> Void
    private let axis:Axis.Set
    private let showIndicators: Bool
    
    init(_ axis: Axis.Set = .vertical,
         showIndicators: Bool = false,
         @ViewBuilder content: @escaping () -> Content,
         onOffsetChanged:@escaping (CGFloat) -> Void) {
        self.axis = axis
        self.showIndicators = showIndicators
        self.content = content
        self.onOffsetChanged = onOffsetChanged
    }
    
    var body: some View {
        ScrollView(axis, showsIndicators: showIndicators) {
            offsetReader
            content()
        }
        .coordinateSpace(name: "frameLayer")
        .onPreferenceChange(OffsetPreferenceKey.self, perform: onOffsetChanged)
    }
    
    /// 添加一个视图用于监听滚动偏移
    var offsetReader: some View {
        GeometryReader { proxy in
            Color.clear
                .preference(key: OffsetPreferenceKey.self, value: proxy.frame(in: .global).minY)
        }
        .frame(height: 0)
    }
}

private struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}
