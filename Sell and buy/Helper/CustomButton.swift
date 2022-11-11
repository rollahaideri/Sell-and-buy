//
//  CustomButton.swift
//  FirebaseTutorialAuth
//
//  Created by Rohullah Haideri on 2022-10-12.
//

import Foundation
import SwiftUI

// A Custom Button and reuseble

struct CustomButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        
            .padding(.horizontal, 100)
            .padding(.vertical, 13)
            .background(Color("Button-Color"))
            .cornerRadius(25)
            .shadow(color: Color("Border-Btn").opacity(0.3), radius: 10, x: 4, y: 4)
            .shadow(color: Color("Border-Btn").opacity(0.3), radius: 10, x: -4, y: -4)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color("Button-Stroke"), lineWidth: 2)
            )
            .foregroundColor(.white)
            .opacity(configuration.isPressed ? 0.3 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        
        
    }
}
