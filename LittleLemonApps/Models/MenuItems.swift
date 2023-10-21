//
//  MenuItems.swift
//  LittleLemonApps
//
//  Created by Reza Alamsyah on 21/10/23.
//

import Foundation

struct MenuItems: Codable, Identifiable {
    var id = UUID()
    let title : String
    let descriptionDish: String
    let price: String
    let image: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case descriptionDish = "description"
        case price = "price"
        case image = "image"
        case category = "category"
    }
}
