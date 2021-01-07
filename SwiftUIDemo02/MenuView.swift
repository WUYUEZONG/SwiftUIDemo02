//
//  MenuView.swift
//  SwiftUIDemo02
//
//  Created by Ginokeo on 2021/1/7.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16.0) {
                Text("Meng - 28% completed")
                Color.white
                    .frame(width: 38, height: 6)
                    .cornerRadius(3.0)
                    .shadow(radius: 10 )
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08))
                    .cornerRadius(3.0)
                    .padding()
                    .frame(width: 150, height: 24)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.1))
                    .cornerRadius(12)
                    .padding(.bottom, 20)
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "creditcard")
                MenuRow(title: "Sign Out", icon: "person.crop.circle")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.8736441135, green: 0.9015384316, blue: 0.951746285, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal, 30.0)
            .overlay(
                Image("avatar")
                    .resizable()
                    .frame(width: 60.0, height: 60.0)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .offset(y: -150)
                    .shadow(color: Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)), radius: 10, x: 0.0, y: -5.0)
                    
            )
            
        }
        .padding(.bottom, 30.0)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    
    var title: String
    var icon: String
    
    var body: some View {
        HStack(spacing: 16.0) {
            Image(systemName: icon)
                .frame(width: 32.0, height: 32.0)
                .font(.system(size: 20, weight: .medium))
                .imageScale(.large)
                .foregroundColor(Color(#colorLiteral(red: 0.6637181044, green: 0.7328339219, blue: 0.8367844224, alpha: 1)))
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: 120.0, alignment: .leading)
        }
    }
}
