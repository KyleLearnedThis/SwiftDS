//
//  Pair.swift
//  SwiftDS
//
//  Created by KyleLearnedThis on 1/30/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import Foundation

class Pair: Hashable, Comparable {
    static func < (lhs: Pair, rhs: Pair) -> Bool {
        return lhs.id < rhs.id
    }

    static func == (lhs: Pair, rhs: Pair) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(id)
    }

    var name: String
    var id: Int
    init( name: String = "Hi", id: Int = 0) {
        self.name = name
        self.id = id
    }
}

