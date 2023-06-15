//
//  HouseView.swift
//  CurvedTabBar
//
//  Created by Choshim.Wei on 2023/6/15.
//

import SwiftUI

struct HouseView: View {
    var body: some View {
        NavigationView {
            Color.purple
                .ignoresSafeArea()
                .navigationTitle("House")
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        NavigationLink {
                            DetailView()
                        } label: {
                            Text("Edit")
                                .font(.system(size: 14, weight: .bold))
                        }
                    }
                    
                }
        }
    }
}

struct HouseView_Previews: PreviewProvider {
    static var previews: some View {
        HouseView()
    }
}
