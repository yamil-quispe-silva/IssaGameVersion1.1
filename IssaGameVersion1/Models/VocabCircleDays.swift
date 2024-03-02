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
    var superScore: Int
}
