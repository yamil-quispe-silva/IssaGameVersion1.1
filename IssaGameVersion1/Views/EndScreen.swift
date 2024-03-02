//
//  EndScreen.swift
//  IssaGameVersion1
//
//  Created by Yamil on 3/1/24.
//

import SwiftUI

struct EndScreen: View {
    @State var viewModel: VocabWordViewModel
    

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
            VStack (spacing: 20) {
                Text("Issa TOEFL Score")
                    .padding()
                    .bold()
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 31))
                    .foregroundColor(.white)
                
                Text("Congrats you completed the game! 🥳")
                    .padding()
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 21))
                    .foregroundColor(.white)
                
                Text("You scored: \(viewModel.score) out of \(viewModel.length)")
                    .padding()
                    .bold()
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 21))
                    .foregroundColor(.white)
                
            } // VStack
            .padding()
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
