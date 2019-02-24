//
//  PriorityQueueTest.swift
//  SwiftDSTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class PriorityQueueTest: XCTestCase {

    func testBasic() {
        var queue = PriorityQueue<Int>(ascending: true, startingValues: [])
        queue.push(10)
        queue.push(6)
        queue.push(9)
        queue.push(7)
        queue.push(8)

        while(!queue.isEmpty) {
            if let element = queue.pop() {
                print("===== \(element) =====")
            }
        }
    }

}
