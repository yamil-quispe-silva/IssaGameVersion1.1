//
//  IssaGameVersion1App.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/14/24.
//

import SwiftUI

@main
struct IssaGameVersion1App: App {
    
    @State private var isSplashScreenViewPresented = true
    var navigationController = NavigationController()
    
    var body: some Scene {
        WindowGroup {
            
            if !isSplashScreenViewPresented {
                ContentView()
                    .environmentObject(navigationController)
            } else {
                SplashScreen(isPresented: $isSplashScreenViewPresented )
            }
            
            
        }
        

    }
}
