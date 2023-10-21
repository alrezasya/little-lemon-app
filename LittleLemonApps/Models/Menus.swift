//
//  Menus.swift
//  LittleLemonApps
//
//  Created by Reza Alamsyah on 21/10/23.
//

import Foundation
import CoreData

struct Menus: Codable {
    let menu: [MenuItems]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}
