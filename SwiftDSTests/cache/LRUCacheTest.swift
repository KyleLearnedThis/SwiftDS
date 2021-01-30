//
//  LRUCacheTest.swift
//  SwiftDSTests
//
//  Created by KyleLearnedThis on 1/30/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class LRUCacheTest: XCTestCase {
    class Pair: Hashable, Comparable {
        static func < (lhs: LRUCacheTest.Pair, rhs: LRUCacheTest.Pair) -> Bool {
            return lhs.id < rhs.id
        }

        static func == (lhs: LRUCacheTest.Pair, rhs: LRUCacheTest.Pair) -> Bool {
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

    func testBasic() throws {
        let cache = LRUCache<Pair>(capacity: 3)
        let names = ["A-Duke", "B-Ella", "C-Bill", "D-Wes"]
        let ids = [1,2,3,4]

        for i in ids.indices {
            let pair = Pair(name: names[i], id: ids[i])
            cache.set(pair, val: pair)
        }
        printCacheOrder(cache)
    }

    private func printCacheOrder(_ cache: LRUCache<Pair>) {
        var cur = cache.queue.head
        while cur != nil {
            let name = String(describing: cur!.value.name)
            print("===== name: \(name) =====")
            cur = cur?.next
        }
    }
}
