//
//  ItemModel.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-29.
//

import Foundation
import FirebaseFirestoreSwift





struct UserData: Codable, Identifiable {
    @DocumentID var id: String?
    var items: [Items]
    
}

struct Items: Codable, Identifiable {
    var id = UUID()
    var title: String
    var price: String
    var description: String
    var image: String?
}
