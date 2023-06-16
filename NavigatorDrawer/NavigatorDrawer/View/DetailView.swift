//
//  DetailView.swift
//  NavigatorDrawer
//
//  Created by Choshim.Wei on 2023/6/16.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle("详情")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .frame(width: 36, height: 36)
                            .foregroundColor(.black)
                    }
                }
            }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

/// 自定义导航返回按钮后侧滑返回失效, 通过添加以下拓展进行修正
extension UINavigationController: UIGestureRecognizerDelegate {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
