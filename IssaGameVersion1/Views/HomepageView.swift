//
//  HomepageView.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/14/24.
//

import SwiftUI

struct HomepageView: View {
    
    //@StateObject private var viewModel = VocabWordViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                CirclesScrollView()
                    //environmentObject(viewModel)
            } // ZStack
        }//VStack General
    }// body View
}//Homepage View



#Preview {
    HomepageView()
}


