//
//  QuestionView.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/24/24.
//

import SwiftUI

struct QuestionView: View {
    var dayNumber: Int
    @ObservedObject var viewModel: VocabWordViewModel
    //to make the back button of the list white
    @Environment(\.presentationMode) var presentationMode
    
    @State private var navigateToEndScreen = false

    
    
    init(dayNumber: Int, viewModel: VocabWordViewModel) {
        self.dayNumber = dayNumber
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        ZStack {
            Background()
            VStack (spacing: 30) {
                HStack {
                    Text("Day \(dayNumber)")
                        .font(Font.custom("Swiss721BT-BlackRounded", size: 25))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("\(viewModel.index + 1) out of \(viewModel.length)")
                        .font(Font.custom("Swiss721BT-BlackRounded", size: 22))
                        .foregroundColor(.white)
                }
                
                ProgressBar(progress: viewModel.progress)
                
                Text(viewModel.question)
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 22))
                    .foregroundColor(.yellow)
                
                
                VStack (alignment: .center, spacing: 23) {
                    ForEach(viewModel.answerChoices, id: \.id) { answer in
                        AnswerRow(answer: answer, viewModel: viewModel)
                    }
                }
                        
                Spacer()
                

                Button {
                    if (viewModel.index + 1 == viewModel.dayWordsArray.count) {
                        navigateToEndScreen = true // Activate navigation link
                    } else {
                        viewModel.goToNextQuestion()
                    }
                } label: {
                    PrimaryButton(text: "Next", background: viewModel.answerSelected ? .white : .gray)
                }
                .disabled(!viewModel.answerSelected)
                
                NavigationLink(destination: EndScreen(viewModel: viewModel), isActive: $navigateToEndScreen) {
                    EmptyView()
                }
                
                
            }
            .padding()
            
        }
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
struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = VocabWordViewModel()
//        viewModel.words = VocabWordViewModel.sampleWords
        return QuestionView(dayNumber: 1, viewModel: viewModel)
    }
}

