//
//  DetailView.swift
//  CurvedTabBar
//
//  Created by Choshim.Wei on 2023/6/15.
//

import SwiftUI

struct DetailView: View {
    
    var body: some View {
        VStack {
            Text("DetailView")
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
