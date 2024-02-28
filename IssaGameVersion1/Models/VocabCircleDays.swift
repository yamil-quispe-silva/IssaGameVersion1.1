//
//  VocabCircleArray.swift
//  IssaGameVersion1
//
//  Created by Yamil on 2/14/24.
//

import Foundation
import SwiftUI

struct VocabCircleDays: Hashable, Identifiable {
    let id = UUID()
    let color: Color
    let title: String
    let emoji: String
    let dayNumber: Int
}

struct VocabCircleArray {
    static var circles = [VocabCircleDays(color: .white, title: "day 1", emoji:"🚀", dayNumber: 1),
                          VocabCircleDays(color: .white, title: "day 2", emoji:"👻", dayNumber: 2),
                          VocabCircleDays(color: .white, title: "day 3", emoji:"❤️", dayNumber: 3),
                          VocabCircleDays(color: .white, title: "day 4", emoji:"🗣️", dayNumber: 4),
                          VocabCircleDays(color: .white, title: "day 5", emoji:"🙌", dayNumber: 5),
                          VocabCircleDays(color: .white, title: "day 6", emoji:"💯", dayNumber: 6),
                          VocabCircleDays(color: .white, title: "day 7", emoji:"👨‍💻", dayNumber: 7),
                          VocabCircleDays(color: .white, title: "day 8", emoji:"🔥", dayNumber: 8),
                          VocabCircleDays(color: .white, title: "day 9", emoji:"☂️", dayNumber: 9),
                          VocabCircleDays(color: .white, title: "day 10", emoji:"😂", dayNumber: 10),
                          VocabCircleDays(color: .white, title: "day 11", emoji:"📚", dayNumber: 11),
                          VocabCircleDays(color: .white, title: "day 12", emoji:"💧", dayNumber: 12),
                          VocabCircleDays(color: .white, title: "day 13", emoji:"🏀", dayNumber: 13),
                          VocabCircleDays(color: .white, title: "day 14", emoji:"👽", dayNumber: 14),
                          VocabCircleDays(color: .white, title: "day 15", emoji:"‼️", dayNumber: 15),
                          VocabCircleDays(color: .white, title: "day 16", emoji:"🌈", dayNumber: 16),
                          VocabCircleDays(color: .white, title: "day 17", emoji:"📘", dayNumber: 17),
                          VocabCircleDays(color: .white, title: "day 18", emoji:"🐽", dayNumber: 18),
                          VocabCircleDays(color: .white, title: "day 19", emoji:"⚽️", dayNumber: 19),
                          VocabCircleDays(color: .white, title: "day 20", emoji:"🚨", dayNumber: 20),
                          VocabCircleDays(color: .white, title: "day 21", emoji:"🏆", dayNumber: 21)]
}

