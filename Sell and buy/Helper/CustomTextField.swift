//
//  TextfieldStyle.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-28.
//

import Foundation

import SwiftUI

struct CustomTextField: TextFieldStyle {
    @FocusState private var isFieldFocused : Bool
    
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .frame(height: 25)
            .font(.pageSubTitle)
            .padding(15)
            .background( Color("Field-Color"))
            
            
            .cornerRadius(14)
//            .shadow(radius: 10)
            .shadow(color: isFieldFocused ? Color("Border-Btn").opacity(0.3): Color.clear, radius: 10, x: -4, y: -4).focused($isFieldFocused)
            .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(isFieldFocused ? Color("Border-Btn"): Color.clear , lineWidth: 1.4).focused($isFieldFocused)
            )
    }
    
}