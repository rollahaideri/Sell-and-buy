//
//  Gradient.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-11-10.
//

import Foundation
import SwiftUI

extension LinearGradient {
    static var customGradient : LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color("Background-Start"),Color("Background-End")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
