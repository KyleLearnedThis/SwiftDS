//
//  LFUCacheTest.swift
//  SwiftDSTests
//
//  Created by KyleLearnedThis on 2/1/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class LFUCacheTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBasic() throws {
        let keys = [1,2,3]
        let names = ["Apple", "Orange", "Cherry"]
        let cache = LFUCache<String>(capacity: 3)

        for i in keys.indices {
            cache.add(key: keys[i], data: names[i])
        }

        print("====== Before ======")
        cache.entryMap.forEach {
            let x = $0
            print("==== key: \(x.key) value: \(x.value.entry.data) freq: \(x.value.entry.frequency) =====")
        }

        for _ in 0..<19 {
            cache.get(key: 1)
        }

        for _ in 0..<9 {
            cache.get(key: 2)
        }

        print("====== Adding data to a full LFU cache ======")
        cache.add(key: 4, data: "Watermelon")
        cache.entryMap.forEach {
            let x = $0
            print("==== key: \(x.key) value: \(x.value.entry.data) freq: \(x.value.entry.frequency) =====")
        }
    }

}
