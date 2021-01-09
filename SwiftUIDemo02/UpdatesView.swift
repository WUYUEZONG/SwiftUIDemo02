//
//  UpdatesView.swift
//  SwiftUIDemo02
//
//  Created by Ginokeo on 2021/1/8.
//

import SwiftUI

struct UpdatesView: View {
    var body: some View {
        NavigationView {
            List(updateData) { item in
                NavigationLink(
                    destination: UpdateDetail(update: item),
                    label: {
                        HStack(spacing: 20.0) {
                            
                            item.image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(12)
                                .frame(width: 90, height: 90)
                                .background(Color.black)
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(item.title)
                                    .font(.system(size: 20, weight: .bold))
                                Text(item.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(item.date.uppercased())
                                    .foregroundColor(.secondary)
                                    
                            }
                        }
                        
                    })
                    .padding(.vertical, 8.0)
            }
            .navigationBarTitle("Update")
        }
        
    }
}

struct UpdatesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UpdatesView()
        }
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: Image
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: Image(uiImage: #imageLiteral(resourceName: "Illustration3")), title: "Swift UI", text: "describe describe describe describe describedescribe describedescribe describe describe describe describe describedescribe describedescribe", date: "Jan 1"),
    Update(image: Image(uiImage: #imageLiteral(resourceName: "Illustration2")), title: "Swift UI", text: "describe describe describe describe describe describe describe describe describe describe", date: "Jan 1"),
    Update(image: Image(uiImage: #imageLiteral(resourceName: "Illustration3")), title: "Swift UI", text: "describe describe describe describe describe", date: "Jan 1"),
    Update(image: Image(uiImage: #imageLiteral(resourceName: "Illustration4")), title: "Swift UI", text: "describe describe describe describe describe", date: "Jan 1"),
    Update(image: Image(uiImage: #imageLiteral(resourceName: "Illustration3")), title: "Swift UI", text: "describe describe describe describe describe describe describe describe describe describe", date: "Jan 1")
]
