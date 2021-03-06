//
//  ContentView.swift
//  SwiftUIDemo02
//
//  Created by Ginokeo on 2021/1/6.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    @State var showFull = false
    @State var bottomState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
                )
            
            BackCardView()
                .frame(width: showCard ? 300 : 340.0, height: 220.0)
                .background(show ? Color.pink : Color("background3"))
                .cornerRadius(20.0)
                .shadow(radius: 20)
                .offset(y: showCard ? -180 : 0)
                .offset(x: viewState.width, y: viewState.height)
                .offset(x: 0.0, y: show ? -400 : -40.0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(showCard ? -10 : 0))
                .rotation3DEffect(
                    .degrees(showCard ? 0 : 10),
                    axis: (x: 10.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            BackCardView()
                .frame(width: 340.0, height: 220.0)
                .background(show ? Color("background3") : Color.pink)
                .cornerRadius(20.0)
                .shadow(radius: 20)
                .offset(y: showCard ? -140 : 0)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(.degrees(showCard ? -5 : 0))
                .rotation3DEffect(
                    .degrees(showCard ? 0 : 5),
                    axis: (x: 10.0, y: 0.0, z: 0.0))
                .offset(x: 0.0, y: show ? -200 : -20.0)
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            CardView()
                .frame(width: showCard ? 375 : 340.0, height: 220.0)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x: 0, y: showCard ? -100 : 0)
                .offset(x: viewState.width, y: viewState.height)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.showCard = false
                            self.viewState = value.translation
                            self.show = true
                        }
                        .onEnded { value in
                            self.viewState = .zero
                            self.show = false
                        }
                )
            
            //Text("\(bottomState.height)").offset(y: -300)
            
            CardBottomView(show: $showCard)
                .offset(x: 0, y: bottomState.height)
                .offset(y: showCard ? 360 : 1000)
                .blur(radius: show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.6, 0.2, 1, duration: 0.8))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            var vh = value.translation.height
                            if self.showFull {
                                vh += -300
                            }
                            if vh < -320 {
                                vh = -320
                            }
                            self.bottomState.height = vh
                            
                        }
                        .onEnded { value in
                            if (self.bottomState.height < -100 && !self.showFull) || (self.showFull && self.bottomState.height < -250) {
                                self.showFull = true
                                self.bottomState.height = -300
                            } else {
                                self.showFull = false
                                self.bottomState = .zero
                            }
                        }
                )
        }
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    Text("Certificate")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40.0, height: 40.0)
            }
            .padding([.top, .leading, .trailing], 20.0)
            Spacer()
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificate")
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
            }
            
            Image("Illustration5")
            Spacer()
        }
        .padding(.all)
    }
}

struct CardBottomView: View {
    
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 60.0, height: 6.0)
                .cornerRadius(3.0)
                .opacity(0.1)
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .font(.body)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .lineLimit(10)
                .lineSpacing(4)
            
                
            HStack(spacing: 20.0) {
                RingView(width: 88, height: 88, percent: 78, show: $show)
                    //.animation(Animation.easeInOut.delay(0.3))
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("SwiftUI").fontWeight(.bold)
                    Text("12 This certificate is proof that Meng To")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
                
            }
            
            Spacer()
        }
        .padding(.all)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
