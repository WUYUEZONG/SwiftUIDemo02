//
//  Modifiers.swift
//  SwiftUIDemo02
//
//  Created by Ginokeo on 2021/1/12.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.1), radius: 20, x: 0, y: 10)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct FontModifier: ViewModifier {
    
    var fontStyle: Font.TextStyle = .body
    
    func body(content: Content) -> some View {
        content
            .font(.system(fontStyle, design: .default))
    }
}

struct CustomFontModifier: ViewModifier {
    
    var size: CGFloat = 28
    
    func body(content: Content) -> some View {
        content.font(.custom("YuseiMagic-Regular", fixedSize: size))
    }
}
