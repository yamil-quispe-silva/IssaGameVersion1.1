//
//  HomepageView.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/14/24.
//

import SwiftUI

struct HomepageView: View {
    
    //@StateObject private var viewModel = VocabWordViewModel()
    @EnvironmentObject var navigationController: NavigationController
    
    var body: some View {
        VStack {
            
            CirclesScrollView()
            
        }
    }// body View
}//Homepage View



#Preview {
    HomepageView()
}


