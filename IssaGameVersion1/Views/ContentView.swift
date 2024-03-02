//
//  ContentView.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/14/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigationController: NavigationController
    
    var body: some View {
        Group {
            if navigationController.shouldShowRoot {
                HomepageView()
            } else {
                CirclesScrollView()
            }
        }
        .onChange(of: navigationController.shouldShowRoot) {
            if navigationController.shouldShowRoot {
                navigationController.resetToRootView()
            }
        }
    }
}

#Preview {
    ContentView()
}
