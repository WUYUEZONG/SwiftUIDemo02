//
//  UpdateDetail.swift
//  SwiftUIDemo02
//
//  Created by Ginokeo on 2021/1/9.
//

import SwiftUI

struct UpdateDetail: View {
    
    var update: Update = updateData[0]
    
    var body: some View {
        List {
            VStack {
                update.image
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
        }
        .navigationBarTitle(update.title)
        .listStyle(DefaultListStyle())
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
