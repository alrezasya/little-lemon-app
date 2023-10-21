//
//  HeroView.swift
//  LittleLemonApps
//
//  Created by Reza Alamsyah on 21/10/23.
//

import SwiftUI

struct HeroView: View {
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(Constants.appName)
                        .foregroundColor(Color.primaryColor2)
                        .font(.displayFont())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(Constants.location)
                        .foregroundColor(.white)
                        .font(.subTitleFont())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer(minLength: 5)
                    Text(Constants.appDescription)
                    .foregroundColor(.white)
                    .font(.leadText())
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                Image("hero-image")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(maxWidth: 120, maxHeight: 140)
                    .clipShape(Rectangle())
                    .cornerRadius(16)
            }
        }
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
            .padding()
            .background(Color.primaryColor1)
            .frame(maxWidth: .infinity, maxHeight: 240)
    }
}
