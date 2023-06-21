//
//  ContentView.swift
//  SwiftUI_UIKit
//
//  Created by Choshim.Wei on 2023/6/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabBarVC() 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabBarVC: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = TabBarViewController()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}


