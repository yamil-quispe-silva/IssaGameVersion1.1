//
//  DayDetailView.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/14/24.
//

import SwiftUI

struct DayDetailView: View {
    
    @EnvironmentObject var navigationController: NavigationController
    @State var viewModel: VocabWordViewModel
    
    
    var dayNumber: Int
    

    //to make the back button of the list white
    @Environment(\.presentationMode) var presentationMode
    
    // Add an initializer to change the scrollbar indicator color
    init(dayNumber: Int, viewModel: VocabWordViewModel) {
        self.dayNumber = dayNumber
        self._viewModel = State(initialValue: viewModel)

        UIScrollView.appearance().indicatorStyle = .white
        
    }
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                Text("Day \(dayNumber)")
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 37))
                    .foregroundColor(.white)
                Text("daily goal:  \(viewModel.length) words")
                    .padding(2)
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 18))
                    .foregroundColor(.yellow)
//                Text("best score:  \(viewModel.circles[dayNumber - 1].superScore) / 20")
//                    .padding(-1)
//                    .font(Font.custom("Swiss721BT-BlackRounded", size: 17))
//                    .foregroundColor(.yellow)
                Spacer()
                    .frame(height: 20)
                List {
                    ForEach(viewModel.wordsForDay(day: dayNumber)) { word in
                        Text("\(word.word)  ---  \(word.translationSpanish)")
                            .padding(8)
                            .bold()
                            .font(Font.custom("Swiss721BT-BlackRounded", size: 20))
                            .foregroundColor(.white)
                            .listRowBackground(Color.clear)
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color.clear)
                
                Spacer()
                    .frame(height: 33)
                
                
                NavigationLink(destination: QuestionView(dayNumber: dayNumber, viewModel: viewModel)){
                    
                    Text("Start!")
                        .padding(.horizontal, 25)
                        .bold()
                        .font(Font.custom("Swiss721BT-BlackRounded", size: 18))
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(35)
                }
                
            }
            .frame(width: 400, height: 670, alignment: .top)
            .padding()
        }
        .onAppear() {
            viewModel.setQuestion()
        }
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

// #Preview
// Update your preview here
struct DayDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = VocabWordViewModel()
//        viewModel.words = VocabWordViewModel.sampleWords
        return DayDetailView(dayNumber: 1, viewModel: viewModel)
    }
}
