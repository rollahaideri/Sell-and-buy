//
//  ItemModel.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-29.
//

import Foundation
import FirebaseFirestoreSwift


struct Items: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var price: String
    var description: String
    
    
}
