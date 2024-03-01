//
//  VocabWordViewModel.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/24/24.
//

import Foundation
import SwiftUI

final class VocabWordViewModel: ObservableObject {
    
    // stores all the words objcts from json
    @Published private(set) var words = [VocabWord]()
    
    // length of array
    @Published private(set) var length = 20
    
    // day number
    @Published private(set) var dayNumber = 0

    // index of current word at the dayWordsArray(20 words)
    @Published private(set) var index = 0
    
    // score for the user
    @Published private(set) var score = 0
    
    // this var indicates if we have reached the end of the array
    @Published private(set) var reachedEnd = false
    
    // this will let us know user selected an answer
    @Published private(set) var answerSelected = false
    
    // this is the question
    @Published private(set) var question: String = ""
    
    // stores answer choices
    @Published private(set) var answerChoices: [Answer] = []
    
    // stores progress of game
    @Published private(set) var progress: CGFloat = 0.00
    
    // has the 20 words of the day circle in an array ////////////////////
    @Published private(set) var dayWordsArray: [VocabWord] = []
    
    // Static sample data for previews
    static let sampleWords: [VocabWord] = [
        VocabWord(word: "consider", definition: "deem to be", translationSpanish: "considerar", sentences: [
            "You should ____________ all options before making a decision.",
            "They didn't ____________ the consequences of their actions."
        ]),
        VocabWord(word: "minute", definition: "infinitely or immeasurably small", translationSpanish: "minuto", sentences: [
            "He arrived at the last ____________.",
            "Every ____________ detail was considered."
        ]),
        VocabWord(word: "accord", definition: "concurrence of opinion", translationSpanish: "acuerdo", sentences: [
            "They reached an ____________ after hours of discussion.",
            "The decision was in ____________ with the company's policy."
        ])
        // Add more samples as needed
    ]
    
        
    
    
    init() {
        
        loadData()
        
        
    }
    
    
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "RealToeflWords500", withExtension: "json") else {
            fatalError("Could not find file in the project")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load file in the project")
        }
        
        let decoder = JSONDecoder()
        
        do {
            // Remove the force unwrap from `data`
            let loadedData = try decoder.decode([VocabWord].self, from: data)

            
            words = loadedData
        } catch {
            fatalError("Could not decode file in the project: \(error)")
        }
        
    }
    
    
    // func to allocate 20 different words per circle day
    func wordsForDay(day: Int) -> [VocabWord] {
        print(dayNumber)
        dayNumber = day
        let startIndex = (day - 1) * 20
        let endIndex = startIndex + 19
        
        // Ensure startIndex is within bounds
        if (startIndex > words.count) {
            dayWordsArray = Array(words[0...19])
            return dayWordsArray
        }

        // Ensure endIndex is within bounds, adjusting if necessary
        let safeEndIndex = min(endIndex, words.count - 1)
        
        // Now it's safe to slice the array
        dayWordsArray = Array(words[startIndex...safeEndIndex])
//        print(words[startIndex...safeEndIndex])
//        length = dayWordsArray.count
        
        
        return dayWordsArray
    }
    
    
    
    //func to randomly choose a question from the word to not repeat it always
    func randomSentenceFromWord(word: VocabWord) -> String {
        let sentences: [String] = dayWordsArray[index].sentences // current word
        let randomIndexSentence = Int.random(in: 0..<sentences.count)
        
        let randomSentence = sentences[randomIndexSentence]
        
        return randomSentence
    }
    
    
    //func to have the corresponding correct answer and the incorrect ones too
    func answerChoicesRandom(word: VocabWord) -> [Answer] {
        var random1IndexFromDayWords = Int.random(in: 0..<dayWordsArray.count)
        var random2IndexFromDayWords = Int.random(in: 0..<dayWordsArray.count)
        var random3IndexFromDayWords = Int.random(in: 0..<dayWordsArray.count)
        
        while (index == random1IndexFromDayWords || random2IndexFromDayWords == random1IndexFromDayWords || random3IndexFromDayWords == random2IndexFromDayWords || random3IndexFromDayWords == random1IndexFromDayWords) {
            random1IndexFromDayWords = Int.random(in: 0..<dayWordsArray.count)
            random2IndexFromDayWords = Int.random(in: 0..<dayWordsArray.count)
            random3IndexFromDayWords = Int.random(in: 0..<dayWordsArray.count)
        }
        
        while (index == random2IndexFromDayWords) {
            random2IndexFromDayWords = Int.random(in: 0..<dayWordsArray.count)
        }
        
        while (index == random3IndexFromDayWords) {
            random3IndexFromDayWords = Int.random(in: 0..<dayWordsArray.count)
        }
        
        // getting the random answers
        let choice1: VocabWord = dayWordsArray[random1IndexFromDayWords]
        let choice2: VocabWord = dayWordsArray[random2IndexFromDayWords]
        let choice3: VocabWord = dayWordsArray[random3IndexFromDayWords]
        
        
        // conversion from VocabWord type to Anwer
        let answer1: Answer = Answer(isCorrect: false, word: choice1.word, definition: choice1.definition, translationSpanish: choice1.translationSpanish, sentences: choice1.sentences)
        
        let answer2: Answer = Answer(isCorrect: false, word: choice2.word, definition: choice2.definition, translationSpanish: choice2.translationSpanish, sentences: choice2.sentences)
        
        let answer3: Answer = Answer(isCorrect: false, word: choice3.word, definition: choice3.definition, translationSpanish: choice3.translationSpanish, sentences: choice3.sentences)
        
        let answer4: Answer = Answer(isCorrect: true, word: word.word, definition: word.definition, translationSpanish: word.translationSpanish, sentences: word.sentences)
        
        answerChoices = [answer1, answer2, answer3, answer4]
        answerChoices.shuffle()
        
        return answerChoices
    }
    
    
    
    // func to go to next question
    func goToNextQuestion() {
        // index of current word at the dayWordsArray(20 words)
//        DispatchQueue.main.async {
            if self.index + 1 < self.length { // < 20
                self.index += 1
                self.setQuestion()
            } else {
                self.reachedEnd = true
            }
//        }
    }
    
    
    // set question func
    func setQuestion() {
//        DispatchQueue.main.async {
            self.answerSelected = false
            self.progress = CGFloat(Double(self.index + 1) / Double(self.length) * 350)
            
            if self.index < self.length {
                let currentWord = self.dayWordsArray[self.index]
                self.question = self.randomSentenceFromWord(word: currentWord) // string
                self.answerChoices = self.answerChoicesRandom(word: currentWord) // array of Answer(s)
            }
//        }
        
    }
    
    func selectAnswer(answer: Answer) {
//        DispatchQueue.main.async {
            self.answerSelected = true
            if answer.isCorrect {
                self.score += 1
            }
//        }
    }
    
    
        
}
