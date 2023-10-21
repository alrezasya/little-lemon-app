//
//  FoodDetailView.swift
//  LittleLemonApps
//
//  Created by Reza Alamsyah on 21/10/23.
//

import SwiftUI

struct FoodDetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    let dish: Dish
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .clipShape(Rectangle())
            .frame(minHeight: 150)
            Text(dish.title ?? "")
                .font(.subTitleFont())
                .foregroundColor(.primaryColor1)
            Spacer(minLength: 20)
            Text(dish.descriptionDish ?? "")
                .font(.regularText())
            Spacer(minLength: 10)
            Text("$" + (dish.price ?? ""))
                .font(.highlightText())
                .foregroundColor(.primaryColor1)
                .monospaced()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailView(dish: PersistenceController.dummyOneDish())
    }
}
