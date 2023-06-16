//
//  CatalogueView.swift
//  NavigatorDrawer
//
//  Created by Choshim.Wei on 2023/6/16.
//

import SwiftUI

struct CatalogueView: View {
    
    var body: some View {
        VStack {
            List(0...20, id: \.self) { index in
                HStack {
                    NavigationLink(destination: DetailView()) {
                        Text("Row \(index)")
                    }
                }
                .frame(height: 100)
            }
            .listStyle(PlainListStyle())
            .scrollIndicators(.hidden)
        }
    }
}

struct CatalogueView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogueView()
    }
}
