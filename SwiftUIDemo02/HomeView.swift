//
//  HomeView.swift
//  SwiftUIDemo02
//
//  Created by Ginokeo on 2021/1/7.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
                AvatarView(showProfile: $showProfile)
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(0 ..< 3) { item in
                        SectionView()
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("Prototype designs in SwiftUI")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(Color.white)
                Spacer()
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            }
            Text("18 Sections".uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            Image("Illustration1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 210)
        }
        .frame(width: cardWidth, height: cardWidth)
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .background(Color("background3"))
        .cornerRadius(30)
        .shadow(color: Color("background3").opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

let cardWidth = screen.width - 60 - 80
