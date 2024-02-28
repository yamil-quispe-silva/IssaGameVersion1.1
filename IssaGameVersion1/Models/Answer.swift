//
//  Answer.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/25/24.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var isCorrect: Bool
    var word: String
    var definition: String
    var translationSpanish: String
    var sentences: [String]
}
