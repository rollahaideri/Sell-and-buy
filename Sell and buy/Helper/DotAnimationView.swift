//
//  DotAnimationView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-11-09.
//

import SwiftUI

struct DotAnimationView: View {
    @State var delay: Double = 0
    @State var scale: CGFloat = 0.5
    var body: some View {
        HStack{
            Circle()
                .frame(width: 12, height: 12)
                .scaleEffect(scale)
                .animation(Animation.easeOut(duration: 0.6).repeatForever().delay(delay), value: scale + 0.5)
//
            Circle()
                .frame(width: 12, height: 12)
                .scaleEffect(scale)
                .animation(Animation.easeOut(duration: 0.6).repeatForever().delay(delay + 0.6), value: scale + 0.5)
               
            Circle()
                .frame(width: 12, height: 12)
                .scaleEffect(scale)
                .animation(Animation.easeOut(duration: 0.6).repeatForever().delay(delay + 0.8), value: scale + 0.5)
                
        }.onAppear{
            withAnimation{
                self.scale = 1
            }
        }
        .frame(width:75, height: 18)
        .padding(.vertical, 8)
        
        
        
    }
}

struct DotAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        DotAnimationView()
    }
}
