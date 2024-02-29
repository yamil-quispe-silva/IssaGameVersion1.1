//
//  AnswerRow.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/25/24.
//

import SwiftUI

struct AnswerRow: View {
//    @EnvironmentObject var triviaManager: TriviaManager
    var answer: Answer
    var viewModel: VocabWordViewModel
    @State private var isSelected = false
    
    // Custom colors
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    var body: some View {
        HStack(spacing: 25) {
            Image(systemName: "circle.fill")
                .font(.caption)
                .foregroundColor(isSelected ? (answer.isCorrect ? green : red): .gray)
            
            Text(answer.word)
                .bold()
                .foregroundColor(isSelected ? (answer.isCorrect ? green : red): .gray)
                .font(Font.custom("Swiss721BT-BlackRounded", size: 19))
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? green : red)
            }
        }
        .padding(26)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 22) // Rounded rectangle overlay
                .stroke(isSelected ? (answer.isCorrect ? green : red): .gray, lineWidth: 16)
        )
        .cornerRadius(22)
        .onTapGesture {
            isSelected = true
//            if !triviaManager.answerSelected {
//                isSelected = true
//                triviaManager.selectAnswer(answer: answer)
//                
//            }
        }
    }
}


// PREVIEW
struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        let viewModelSample = VocabWordViewModel()
        AnswerRow(answer: Answer(isCorrect: false, word: "consider", definition: "def", translationSpanish: "trans", sentences: ["",""]), viewModel: viewModelSample)
    }
}
