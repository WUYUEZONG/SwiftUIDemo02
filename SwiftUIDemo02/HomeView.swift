//
//  HomeView.swift
//  SwiftUIDemo02
//
//  Created by Ginokeo on 2021/1/7.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    
    var body: some View {
        VStack {
            HStack(spacing: 10.0) {
                Text("Watching")
                    .modifier(CustomFontModifier())
                Spacer()
                AvatarView(showProfile: $showProfile)
                
                Button(action: { self.showUpdate.toggle() }, label: {
                    Image(systemName: "bell")
                        .renderingMode(.original)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0.0, y: 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0.0, y: 10)
                })
                .sheet(isPresented: $showUpdate, content: {
                    UpdatesView()
                })
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20.0) {
                    HStack {
                        RingView(width: 44, height: 44, show: .constant(true))
                        VStack(alignment: .leading, spacing: 4.0) {
                            Text("6 minutes left")
                                .font(.headline)
                            Text("12 sections to do today")
                                .font(.subheadline)
                        }
                    }
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(20)
                    .modifier(ShadowModifier())
                    
                    RingView(width: 44, height: 44, show: .constant(true))
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.1), radius: 20, x: 0, y: 10)
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                    
                    RingView(width: 44, height: 44, show: .constant(true))
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.1), radius: 20, x: 0, y: 10)
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                }
                .padding(.leading, 30)
                .padding(.vertical, 30)
                .offset(y: -10)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(
                                    .degrees(Double(geometry.frame(in: CoordinateSpace.global).minX) / -20),
                                    axis: (x: 10, y: 10.0, z: 0.0))
                        }
                        .frame(width: cardWidth, height: cardWidth)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }
            .offset(y: -40)
            
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
    
    var section: Section
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(Color.white)
                Spacer()
                Image(section.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)

        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .frame(width: cardWidth, height: cardWidth)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

let cardWidth: CGFloat = screen.width - 60 - 40

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var color: Color
    var image: Image
}

let sectionData = [
    Section(
        title: "Prototype designs in SwiftUI",
        text: "18 Sections",
        logo: "Logo",
        color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)),
        image: Image(uiImage: #imageLiteral(resourceName: "Illustration1"))
    ),
    Section(
        title: "Prototype designs in SwiftUI",
        text: "18 Sections",
        logo: "Logo",
        color: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)),
        image: Image(uiImage: #imageLiteral(resourceName: "Illustration4"))
    ),
    Section(
        title: "Prototype designs in SwiftUI",
        text: "18 Sections",
        logo: "Logo",
        color: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)),
        image: Image(uiImage: #imageLiteral(resourceName: "Illustration3"))
    )
]
