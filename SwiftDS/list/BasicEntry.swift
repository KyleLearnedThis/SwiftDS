//
//  Widget.swift
//  SwiftDS
//
//  Created by KyleLearnedThis on 1/29/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import Foundation

class BasicEntry: Comparable {
    var name: String
    var id: Int

    init(_ name: String = "Hello", _ value: Int = -1) {
        self.name = name
        self.id = value
    }

    static func < (lhs: BasicEntry, rhs: BasicEntry) -> Bool {
        return lhs.id < rhs.id
    }

    static func == (lhs: BasicEntry, rhs: BasicEntry) -> Bool {
        return lhs.id == rhs.id
    }
}
