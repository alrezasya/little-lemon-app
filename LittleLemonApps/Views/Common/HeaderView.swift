//
//  HeaderView.swift
//  LittleLemonApps
//
//  Created by Reza Alamsyah on 21/10/23.
//

import SwiftUI

struct HeaderView: View {
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 140.0, height: 32.0)
                    HStack {
                        Spacer()
                        if isLoggedIn {
                            NavigationLink(destination: ProfileView()) {
                                Image("user")
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .frame(maxHeight: 50)
                                    .clipShape(Circle())
                                    .padding(.trailing)
                            }
                        }
                    }
                }
            }
        }
        .frame(maxHeight: 50)
        
        .onAppear() {
            if UserDefaults.standard.bool(forKey: Constants.isLoggedInKey) {
                isLoggedIn = true
            } else {
                isLoggedIn = false
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
