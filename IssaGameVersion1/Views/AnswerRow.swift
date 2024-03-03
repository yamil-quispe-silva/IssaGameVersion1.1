//
//  AnswerRow.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/25/24.
//

//import SwiftUI
//
//struct AnswerRow: View {
////    @EnvironmentObject var triviaManager: TriviaManager
//    var answer: Answer
//    var viewModel: VocabWordViewModel
//    @State private var isSelected = false
//    
//    // Custom colors
//    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
//    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
//    
//    var body: some View {
//        HStack(spacing: 25) {
//            Image(systemName: "circle.fill")
//                .font(.caption)
//                .foregroundColor(isSelected ? (answer.isCorrect ? green : red): .gray)
////                .foregroundColor(viewModel.answerSelected ? (answer.isCorrect ? green : red) : .gray)
//            
//            HStack(spacing: 2) {
//                Text(answer.word)
//                    .foregroundColor(isSelected ? (answer.isCorrect ? green : red): .gray)
//                    .font(Font.custom("Swiss721BT-BlackRounded", size: 19))
//                
//                // Conditionally show the translation
//                Text(" =  \(answer.translationSpanish)")
////                    .foregroundColor(isSelected ? (answer.isCorrect ? green : red): .gray)
//                    .foregroundColor(viewModel.answerSelected ? .gray : .white)
//                
//                  
//                
//                    .font(Font.custom("Swiss721BT-BlackRounded", size: 17))
//            }
//            
// 
//            Spacer()
//            
//        
////            if isSelected {
////                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
////                    .foregroundColor(answer.isCorrect ? green : red)
////            }
//            
//            
//            if viewModel.answerSelected && isSelected {
//                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
//                    .foregroundColor(answer.isCorrect ? green : red)
//            }
//        }
//        .padding(26)
//        .frame(maxWidth: .infinity, alignment: .leading)
//        
//        .background(.white)
//        .overlay(
//            RoundedRectangle(cornerRadius: 22) // Rounded rectangle overlay
////                .stroke(viewModel.answerSelected ? (isSelected ? (answer.isCorrect ? green : red): .gray) : .gray, lineWidth: 16)
//            
//                .stroke(viewModel.answerSelected ? (isSelected || !viewModel.answerSelected ? (answer.isCorrect ? green : red) : .gray) : .gray, lineWidth: 16)
//            
//        )
//        .cornerRadius(22)
//        .onTapGesture {
//            if !viewModel.answerSelected {
//                isSelected = true
//                viewModel.selectAnswer(answer: answer)
//            }
//        }
//    }
//}




import SwiftUI

struct AnswerRow: View {
    var answer: Answer
    @ObservedObject var viewModel: VocabWordViewModel
    @State private var isSelected = false
    
    // Custom colors
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    var body: some View {
        HStack(spacing: 25) {
            Image(systemName: "circle.fill")
                .font(.caption)
                .foregroundColor(viewModel.answerSelected && answer.isCorrect ? green : (isSelected ? red : .gray))
                
            
            
            HStack(spacing: 5) {
                Text(answer.word)
                    .bold()
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
//                    .foregroundColor(isSelected ? (answer.isCorrect ? green : red): .gray)
                    .foregroundColor(viewModel.answerSelected ? (isSelected ? (answer.isCorrect ? green : red) : (answer.isCorrect ? green : .gray)): .gray)
                
                
                
                
                
                Text("= \(answer.translationSpanish)")
                    .font(Font.custom("Swiss721BT-BlackRounded", size: 16))
                    .foregroundColor(viewModel.answerSelected ? (isSelected ? (answer.isCorrect ? green : red): (answer.isCorrect ? green : .gray)) : .clear)
                    
            }
            
            Spacer()
            
            // only show the color for the isCorrect in green
            // or the isSelect if is false
            if viewModel.answerSelected {
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(isSelected ? (answer.isCorrect ? green : .red) : (answer.isCorrect ? green : .gray))
            }
        }
        .padding(26)
        .background(Color.white)
        .cornerRadius(22)
        .overlay(
            RoundedRectangle(cornerRadius: 22) 
            
                .stroke(viewModel.answerSelected ? (isSelected ? (answer.isCorrect ? green : red): .gray) : .gray, lineWidth: 10)
            
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
