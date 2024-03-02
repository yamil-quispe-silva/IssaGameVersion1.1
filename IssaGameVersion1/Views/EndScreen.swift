//
//  EndScreen.swift
//  IssaGameVersion1
//
//  Created by Yamil on 3/1/24.
//

import SwiftUI

struct EndScreen: View {
    @State var viewModel: VocabWordViewModel
    @EnvironmentObject var navigationController: NavigationController

    //to make the back button of the list white
    @Environment(\.presentationMode) var presentationMode
    
    // Add an initializer to change the scrollbar indicator color
    init(viewModel: VocabWordViewModel) {
        self._viewModel = State(initialValue: viewModel)
//        self.wordsArray = viewModel.wordsForDay(day: dayNumber)
        // Change the scrollbar indicator color to white
        UIScrollView.appearance().indicatorStyle = .white
    }
    
    
    var body: some View {
        ZStack {
            Background()
            VStack {
               
                Text("🔥")
                    .bold()
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 30))
                    .foregroundColor(.white)
                    .padding(.top)
                    .padding(2)
                Text("YOUR SCORE:")
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 25))
                    .foregroundColor(.white)
                
                Spacer()
                
                
                Text("\(viewModel.score)")
                    .bold()
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 210))
                    .foregroundColor(.white)
                Text("out of \(viewModel.length)")
                    .bold()
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 23))
                    .foregroundColor(.white)
                
                Spacer()
                
                Button("Back Home") {
                    navigationController.resetToRootView()
                    viewModel.updateBestScore()
                    viewModel.resetGame()
                }
                .foregroundColor(.black)
                .font(Font.custom("Swiss721BT-BlackRounded", size: 18))
                .padding(.vertical, 14)
                .padding(.horizontal, 30)
                .background(.white)
                .clipShape(Capsule())
                .padding(20)
                
            } // VStack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        } // ZStack
        //to make the back button white
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.backward") // SwiftUI's default back arrow icon
                            .foregroundColor(.white) // Customize the color here
                        Text("Back")
                            .font(Font.custom("Swiss721BT-BlackRounded", size: 18)) // Customize the font here
                            .foregroundColor(.white) // Customize the color to match the arrow icon
                    }
                }
            }
        }
    }
}


// PREVIEW
struct EndScreen_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = VocabWordViewModel()
//        viewModel.words = VocabWordViewModel.sampleWords
        return EndScreen(viewModel: viewModel)
    }
}
