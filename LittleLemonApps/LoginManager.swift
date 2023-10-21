//
//  LoginManager.swift
//  LittleLemonApps
//
//  Created by Reza Alamsyah on 22/10/23.
//

import Foundation
import SwiftUI

class LoginManager : ObservableObject {
    @Published var isLoggedIn = false
    
    func login() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation {
                if UserDefaults.standard.bool(forKey: Constants.isLoggedInKey) {
                    self.isLoggedIn = true
                } else {
                    self.isLoggedIn = false
                }
            }
        }
    }
}
