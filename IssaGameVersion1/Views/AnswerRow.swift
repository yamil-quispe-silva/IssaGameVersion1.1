//
//  AnswerRow.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/25/24.
//

import SwiftUI

struct AnswerRow: View {
    var answer: Answer
    @ObservedObject var viewModel: VocabWordViewModel
    @State private var isSelected = false
    
    // Custom colors
//    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
//    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    var body: some View {
        HStack(spacing: 25) {
            Image(systemName: "circle.fill")
                .font(.caption)
                .foregroundColor(viewModel.answerSelected && answer.isCorrect ? .green : (isSelected ? .red : .gray))
                
            
            
            VStack(alignment: .leading, spacing: -3) {
                Text(answer.word)
                    .bold()
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 17))
                    .foregroundColor(viewModel.answerSelected ? (isSelected ? (answer.isCorrect ? .green : .red) : (answer.isCorrect ? .green : .gray)): .gray)
//                    .fixedSize(horizontal: false, vertical: true)
                
                
                Text("= \(answer.translationSpanish)")
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 15))
                    .foregroundColor(viewModel.answerSelected ? (isSelected ? (answer.isCorrect ? .green : .red): (answer.isCorrect ? .green : .gray)) : .clear)
                    .fixedSize(horizontal: false, vertical: true)
                    
            }
            
            
            
            
            
//            
//            HStack(spacing: 4) {
//                VStack(alignment: .leading, spacing: 1) { // Use a VStack for vertical stacking
//                    Text(answer.word)
//                        .bold()
//                        .font(Font.custom("Swiss721BT-BlackRounded", size: 17))
//                        .foregroundColor(viewModel.answerSelected ? (isSelected ? (answer.isCorrect ? .green : .red) : (answer.isCorrect ? .green : .gray)): .gray)
//                        .fixedSize(horizontal: false, vertical: true) // Allow text to wrap vertically
//                    
//                    Text("= \(answer.translationSpanish)")
//                        .font(Font.custom("Swiss721BT-BlackRounded", size: 13))
//                        .foregroundColor(viewModel.answerSelected ? (isSelected ? (answer.isCorrect ? .green : .red) : (answer.isCorrect ? .green : .gray)) : .clear)
//                        .fixedSize(horizontal: false, vertical: true) // Allow text to wrap vertically
//                }
//                .frame(maxWidth: .infinity, alignment: .leading) // Use maximum available width
//                
//            }
//            
            
            
            
            
            Spacer()
            
            // only show the color for the isCorrect in green
            // or the isSelect if is false
            if viewModel.answerSelected {
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(isSelected ? (answer.isCorrect ? .green : .red) : (answer.isCorrect ? .green : .gray))
            }
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(22)
        .overlay(
            RoundedRectangle(cornerRadius: 22) 
            
                .stroke(viewModel.answerSelected ? (isSelected ? (answer.isCorrect ? .green : .red): .gray) : .gray, lineWidth: 8)
            
//                .stroke(viewModel.answerSelected ? (isSelected || !viewModel.answerSelected ? (answer.isCorrect ? green : red) : .gray) : .gray, lineWidth: 8)
            
        )
        .onTapGesture {
            if !viewModel.answerSelected {
                isSelected = true
                viewModel.selectAnswer(answer: answer)
            }
        }
    }
}








// PREVIEW
struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        let viewModelSample = VocabWordViewModel()
        AnswerRow(answer: Answer(isCorrect: true, word: "consider", definition: "def", translationSpanish: "trans", sentences: ["",""]), viewModel: viewModelSample)
    }
}
