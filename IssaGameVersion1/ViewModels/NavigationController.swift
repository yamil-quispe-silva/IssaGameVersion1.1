//
//  NavigationController.swift
//  IssaGameVersion1
//
//  Created by Yamil on 3/1/24.
//

import SwiftUI


class NavigationController: ObservableObject {
    
    @Published var shouldShowRoot = false
    
    // Toggle the state back after setting it to true to prevent continuous resets
    func resetToRootView() {
        DispatchQueue.main.async {
            self.shouldShowRoot = true
            // Add a slight delay before setting it back to false to ensure the UI has time to react
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.shouldShowRoot = false
            }
        }
    }
    
}
