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
    
    // stores percentage of best score from user
    @Published private(set) var percentBestScore = 0
    
    //stores the best score so far
    @Published private(set) var bestScore = 0
    
    // non static array for circles content:
    @Published var circles = [VocabCircleDays(color: .white, title: "day 1", emoji:"🚀", dayNumber: 1, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 2", emoji:"👻", dayNumber: 2, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 3", emoji:"❤️", dayNumber: 3, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 4", emoji:"🗣️", dayNumber: 4, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 5", emoji:"🙌", dayNumber: 5, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 6", emoji:"💯", dayNumber: 6, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 7", emoji:"👨‍💻", dayNumber: 7, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 8", emoji:"🔥", dayNumber: 8, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 9", emoji:"👀", dayNumber: 9, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 10", emoji:"😂", dayNumber: 10, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 11", emoji:"📚", dayNumber: 11, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 12", emoji:"💧", dayNumber: 12, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 13", emoji:"🏀", dayNumber: 13, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 14", emoji:"✅", dayNumber: 14, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 15", emoji:"‼️", dayNumber: 15, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 16", emoji:"🌈", dayNumber: 16, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 17", emoji:"📘", dayNumber: 17, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 18", emoji:"🐽", dayNumber: 18, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 19", emoji:"⚽️", dayNumber: 19, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 20", emoji:"🚨", dayNumber: 20, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 21", emoji:"💀", dayNumber: 21, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 22", emoji:"💰", dayNumber: 22, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 23", emoji:"💥", dayNumber: 23, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 24", emoji:"🌹", dayNumber: 24, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 25", emoji:"💙", dayNumber: 25, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 26", emoji:"💪", dayNumber: 26, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 27", emoji:"🚨", dayNumber: 27, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 28", emoji:"🎂", dayNumber: 28, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 29", emoji:"🎉", dayNumber: 29, superScore: 0),
                              VocabCircleDays(color: .white, title: "day 30", emoji:"🏆", dayNumber: 30, superScore: 0)]
    
    
    
    
    
    
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
//        print(words.count)
        dayNumber = day
//        print(dayNumber)
//        print("dayNumber = \(dayNumber)")
        let startIndex = (day - 1) * 20
//        print("startIndex = \(startIndex)")
        let endIndex = startIndex + 19
//        print("endIndex = \(endIndex)")
        // Ensure startIndex is within bounds
        if (startIndex > words.count) {
            dayWordsArray = Array(words[0...19])
            return dayWordsArray
        }

        // Ensure endIndex is within bounds, adjusting if necessary
        let safeEndIndex = min(endIndex, words.count - 1)
//        print("safeIndex = \(safeEndIndex)")
        // Now it's safe to slice the array
        dayWordsArray = Array(words[startIndex...safeEndIndex])
//        print(dayWordsArray)
//        print("dayWordsArray.count = \(dayWordsArray.count)")
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
        var random1IndexFromDayWords = Int.random(in: 0..<words.count)
        var random2IndexFromDayWords = Int.random(in: 0..<words.count)
        var random3IndexFromDayWords = Int.random(in: 0..<words.count)
        
        while (index == random1IndexFromDayWords || random2IndexFromDayWords == random1IndexFromDayWords || random3IndexFromDayWords == random2IndexFromDayWords || random3IndexFromDayWords == random1IndexFromDayWords) {
            random1IndexFromDayWords = Int.random(in: 0..<words.count)
            random2IndexFromDayWords = Int.random(in: 0..<words.count)
            random3IndexFromDayWords = Int.random(in: 0..<words.count)
        }
        
        while (index == random2IndexFromDayWords) {
            random2IndexFromDayWords = Int.random(in: 0..<words.count)
        }
        
        while (index == random3IndexFromDayWords) {
            random3IndexFromDayWords = Int.random(in: 0..<words.count)
        }
        
        // getting the random answers
        let choice1: VocabWord = words[random1IndexFromDayWords]
        let choice2: VocabWord = words[random2IndexFromDayWords]
        let choice3: VocabWord = words[random3IndexFromDayWords]
        
        
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
    
    
    
    func updateSuperScore(forDay dayNumber: Int, withScore bestScore: Int) {
        if let index = circles.firstIndex(where: { $0.dayNumber == dayNumber }) {
            // Update the superScore for a specific day
            circles[index].superScore = bestScore
            // Notify observers that there has been a change
            self.objectWillChange.send()
            print(circles)
        }
    }
    
    
    func updateBestScore() {
        let newBestScore = max(bestScore, score)
        if newBestScore > bestScore {
            bestScore = newBestScore
        }
        updateSuperScore(forDay: dayNumber, withScore: newBestScore)
    }
    
    
    
    func resetGame() {
        score = 0
        index = 0
        reachedEnd = false
        answerSelected = false
        progress = 0.00
        question = ""
        answerChoices = []
        dayWordsArray = [] // Assuming you want to reset this as well
        percentBestScore = 0
        bestScore = 0
        // Add any other properties you need to reset
    }
    
        
}
