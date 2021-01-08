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
                    destination: Text("Destination"),
                    label: {
                        HStack {
                            
                            Image(item.image)
                            
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
            }
            .navigationBarTitle("Update")
        }
        
    }
}

struct UpdatesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UpdatesView()
            UpdatesView()
                .previewDevice("iPhone 8")
            UpdatesView()
                .preferredColorScheme(.dark)
        }
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "logo", title: "Swift UI", text: "describe describe describe describe describedescribe describedescribe describe describe describe describe describedescribe describedescribe", date: "Jan 1"),
    Update(image: "logo", title: "Swift UI", text: "describe describe describe describe describe describe describe describe describe describe", date: "Jan 1"),
    Update(image: "logo", title: "Swift UI", text: "describe describe describe describe describe", date: "Jan 1"),
    Update(image: "logo", title: "Swift UI", text: "describe describe describe describe describe", date: "Jan 1"),
    Update(image: "logo", title: "Swift UI", text: "describe describe describe describe describe describe describe describe describe describe", date: "Jan 1")
]
