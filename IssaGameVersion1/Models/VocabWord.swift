//
//  VocabWord.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/14/24.
//

import Foundation

// JSON file only has 230 words, counting starting from 1

struct VocabWord: Codable, Identifiable {
    
    enum CodingKeys: CodingKey {
        case word
        case definition
        case translationSpanish
        case sentences
    }
    
    var id = UUID()
    var word: String
    var definition: String
    var translationSpanish: String
    var sentences: [String]
    
}
