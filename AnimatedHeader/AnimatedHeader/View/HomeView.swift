//
//  HomeView.swift
//  AnimatedHeader
//
//  Created by Choshim.Wei on 2023/6/7.
//

import SwiftUI

var rect = UIScreen.main.bounds
var edges = UIApplication.shared.windows.first?.safeAreaInsets

struct HomeView: View {
    
    @StateObject var headerViewModel = HeaderViewModel()
    
    private var maxOffset: CGFloat {
        headerViewModel.startMinY + (edges?.top ?? 0) + 10
    }
    
    init () {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ZStack(alignment: .top, content: {
            HeaderView()
                .zIndex(1)
                .offset(y: headerViewModel.headerOffset)
                        
            ScrollViewOffset {
                VStack(spacing: 15, content: {
                    ForEach(1...5, id: \.self, content: { index in
                        Image("thumb\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: rect.width - 30, height: 250)
                            .cornerRadius(1)
                        
                        HStack(spacing: 10, content: {
                            Image("profile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4, content: {
                                Text("New Sony Camera Unboxing and Review")
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                                
                                Text("iJustine. 4 hours ago")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            })
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom, 15)
                    })
                })
                .padding(.top, 75)
            } onOffsetChanged: { minY in
                print(minY)
                if headerViewModel.startMinY == 0 {
                    headerViewModel.startMinY = minY
                }
                let offset = headerViewModel.startMinY - minY
                if (offset > headerViewModel.offset) {
                    print("Top")
                    headerViewModel.bottomScrollOffset = 0
                    if headerViewModel.topScrollOffset == 0 {
                        headerViewModel.topScrollOffset = offset
                    }
                    
                    let progress = headerViewModel.topScrollOffset + maxOffset - offset
                    
                    let offsetCondition = headerViewModel.topScrollOffset + maxOffset >= maxOffset && maxOffset - progress <= maxOffset
                    
                    let headerOffset = offsetCondition ? -(maxOffset - progress):-maxOffset
                    print(headerOffset)
                    headerViewModel.headerOffset = headerOffset
                }
                if offset < headerViewModel.offset {
                    print("Bottom")
                    headerViewModel.topScrollOffset = 0
                    if headerViewModel.bottomScrollOffset == 0 {
                        headerViewModel.bottomScrollOffset = offset
                    }
                    
                    withAnimation(.easeOut(duration: 0.25)) {
                        let headerOffset = headerViewModel.headerOffset
                        headerViewModel.headerOffset = headerViewModel.bottomScrollOffset >= offset + 40 ? 0:(headerOffset != maxOffset ? 0:-headerOffset)
                    }
                }
                headerViewModel.offset = offset
            }
                    
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
