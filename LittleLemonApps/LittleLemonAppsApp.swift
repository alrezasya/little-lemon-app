//
//  LittleLemonAppsApp.swift
//  LittleLemonApps
//
//  Created by Reza Alamsyah on 19/10/23.
//

import SwiftUI


@main
struct LittleLemonAppsApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var loginManager = LoginManager()

    var body: some Scene {
        WindowGroup {
            if loginManager.isLoggedIn {
                HomeView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            } else {
                OnBoardingView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
