//
//  Network.swift
//  LittleLemonApps
//
//  Created by Reza Alamsyah on 21/10/23.
//

import Foundation
import CoreData

struct Network {
    static func getMenus(viewContext: NSManagedObjectContext) {
        PersistenceController.shared.clear()
            
        let url = URL(string: Constants.menuUrl)
            let request = URLRequest(url: url!)
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request) { data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    if let fullMenu = try? decoder.decode(Menus.self, from: data) {
                        for dish in fullMenu.menu {
                            let newDish = Dish(context: viewContext)
                            newDish.title = dish.title
                            newDish.price = dish.price
                            newDish.descriptionDish = dish.descriptionDish
                            newDish.image = dish.image
                            newDish.category = dish.category
                        }
                        try? viewContext.save()
                    } else {
                        print(error.debugDescription.description)
                    }
                } else {
                    print(error.debugDescription.description)
                }
            }
            dataTask.resume()
        }
}
