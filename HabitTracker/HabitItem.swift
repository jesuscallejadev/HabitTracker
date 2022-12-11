//
//  HabitItem.swift
//  HabitTracker
//
//  Created by Jesus Calleja on 11/12/22.
//

import Foundation

struct HabitItem: Codable, Equatable {
    let name: String
    let description: String
    var count: Int
}

