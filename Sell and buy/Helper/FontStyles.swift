//
//  FontStyles.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-28.
//

import Foundation
import SwiftUI

extension Font {
    
    static var pageTitle: Font {
        return Font.custom("Poppins-Medium", size: 42)
    }
    
    static var pageSubTitle: Font {
        return Font.custom("Poppins-Regular", size: 20)
    }
    
    static var buttonTitle: Font {
        return Font.custom("Poppins-Medium", size: 24)
    }
    
    static var itemTitle: Font {
        return Font.custom("Poppins-Medium", size: 18)
    }
    
    static var itemPrice: Font {
        return Font.custom("Poppins-Regular", size: 14)
    }
    
}
