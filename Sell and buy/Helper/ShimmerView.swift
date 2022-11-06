//
//  ShimmerView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-11-05.
//

import SwiftUI

struct ShimmerView: View {
    
    @State var show = false
    
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.25)
                .frame(width: 150 ,height: 100)
                
            Color.white
                .frame(width: 150, height: 100)
                .mask (
                Rectangle()
                    .fill(
                        LinearGradient(gradient: .init(colors: [.clear, Color.white.opacity(0.48), .clear]), startPoint: .top, endPoint: .bottom)
                    )
                )
                .rotationEffect(.init(degrees: 70))
                .offset(x: self.show ? 150 : -150)
        }
        .onAppear{
            withAnimation(Animation.default.speed(0.15).delay(0)
                .repeatForever(autoreverses: false)){
                    self.show.toggle()
                }
            
        }
        
    }
}

struct ShimmerView_Previews: PreviewProvider {
    static var previews: some View {
        ShimmerView()
    }
}
