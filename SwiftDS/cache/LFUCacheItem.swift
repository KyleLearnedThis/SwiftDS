//
//  CacheEntry.swift
//  SwiftDS
//
//  Created by KyleLearnedThis on 2/1/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import Foundation

class LFUCacheItem<T>: Comparable {

    var data: T
    var frequency: Int

    init(data: T, frequency: Int = 0) {
        self.data = data
        self.frequency = frequency
    }

    @discardableResult
    func incrementFrequency() -> Int {
        self.frequency += 1
        return self.frequency
    }

    // Sort by frequency
    static func < (lhs: LFUCacheItem<T>, rhs: LFUCacheItem<T>) -> Bool {
        lhs.frequency < rhs.frequency
    }

    static func == (lhs: LFUCacheItem<T>, rhs: LFUCacheItem<T>) -> Bool {
        lhs.frequency == rhs.frequency
    }
}
