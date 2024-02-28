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
    @Published var words = [VocabWord]()
    
    // length of array
    @Published private(set) var length = 0
    
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
            
            DispatchQueue.main.async {
                self.words = loadedData
                self.dayWordsArray = self.wordsForDay(day: self.dayNumber)
                self.length = self.dayWordsArray.count
                self.setQuestion()
            }
            
            
            
        } catch {
            fatalError("Could not decode file in the project: \(error)")
        }
        
    }
    
    
    // func to allocate 20 different words per circle day
    func wordsForDay(day: Int) -> [VocabWord] {
        dayNumber = day
        let startIndex = (day - 1) * 20
        let endIndex = startIndex + 19
        
        // Check if the startIndex is out of bounds.
        // If startIndex is greater than or equal to the number of words, reset to day 1 or handle appropriately.
        if startIndex >= words.count {
            // Return early or handle the case where there are not enough words.
            // This could be returning words for day 1, or returning an empty array, etc.
            return wordsForDay(day: 1) // Recursive call, make sure this doesn't create an infinite loop under certain conditions.
        }

        // Calculate the safe endIndex to ensure it does not go out of bounds.
        let safeEndIndex = min(endIndex, words.count - 1)
        
        // Now that we have ensured our indices are safe, we can slice the array without causing an out-of-bounds exception.
        let dayWordsArray = Array(words[startIndex...safeEndIndex])
        
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
        let random1IndexFromDayWords = Int.random(in: 0..<dayWordsArray.count)
        let random2IndexFromDayWords = Int.random(in: 0..<dayWordsArray.count)
        let random3IndexFromDayWords = Int.random(in: 0..<dayWordsArray.count)
        
        let choice1: VocabWord = dayWordsArray[random1IndexFromDayWords]
        let choice2: VocabWord = dayWordsArray[random2IndexFromDayWords]
        let choice3: VocabWord = dayWordsArray[random3IndexFromDayWords]
        
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
        if index + 1 < length {         // < 20
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    
    // set question func
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350)
        
        if index < length {
            let currentWord = (dayWordsArray[index])
            question = randomSentenceFromWord(word: currentWord) // string
            answerChoices = answerChoicesRandom(word: currentWord) // array of Answer(s)
            
        }
        
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
    
    
        
}
