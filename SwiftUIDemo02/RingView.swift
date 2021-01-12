//
//  RingView.swift
//  SwiftUIDemo02
//
//  Created by Ginokeo on 2021/1/12.
//

import SwiftUI

struct RingView: View {
    
    var colorStart: Color = .red
    var colorEnd: Color = .blue
    var width: CGFloat = 300
    var height: CGFloat = 300
    var percent: CGFloat = 88
    @Binding var show: Bool
    
    
    var body: some View {
        
        let multiplier = width / 44
        let progress = 1.0 - (percent / 100.0)
        
        ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity))
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: show ? progress : 1, to: 1.0)
                .stroke(LinearGradient(gradient: Gradient(colors: [colorStart, colorEnd]), startPoint: .topTrailing, endPoint: .bottomLeading), style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity))
                .rotationEffect(.degrees(90))
                .rotation3DEffect(
                    .degrees(180),
                    axis: (x: 1.0 * multiplier, y: 0.0, z: 0.0))
                .frame(width: width, height: height)
                .shadow(color: colorEnd.opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
                
                
            Text("\(Int(percent))%")
                .font(.system(size: multiplier * 14, weight: .bold))
                .onTapGesture {
                    self.show.toggle()
                }
                
        }
        
        
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(false))
    }
}
