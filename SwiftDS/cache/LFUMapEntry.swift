//
//  LFUMapEntry.swift
//  SwiftDS
//
//  Created by KyleLearnedThis on 2/1/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import Foundation

class LFUMapEntry<T: Comparable>: Comparable {
    static func < (lhs: LFUMapEntry<T>, rhs: LFUMapEntry<T>) -> Bool {
        lhs.entry < rhs.entry
    }

    static func == (lhs: LFUMapEntry<T>, rhs: LFUMapEntry<T>) -> Bool {
        lhs.entry == rhs.entry
    }

    var key: Int
    var entry: LFUCacheItem<T>
    init(key: Int, entry: LFUCacheItem<T>) {
        self.key = key
        self.entry = entry
    }
}
