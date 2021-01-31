//
//  LRUCacheTest.swift
//  SwiftDSTests
//
//  Created by KyleLearnedThis on 1/30/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class LRUCacheTest: XCTestCase {

    func testBasic() throws {
        let cache = LRUCache<Pair>(capacity: 3)
        let names = ["A-Duke", "B-Ella", "C-Bill", "D-Wes"]
        let ids = [1,2,3,4]

        for i in ids.indices {
            let pair = Pair(name: names[i], id: ids[i])
            cache.set(pair, val: pair)
        }
        let expected = "D-Wes"
        let actual = cache.queue.head?.value.name

        XCTAssertEqual(expected, actual)
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
