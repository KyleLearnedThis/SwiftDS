//
//  QueueTest.swift
//  SwiftDSTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class QueueTest: XCTestCase {

    func testBasic() {
        let queue = Queue<String>()
        queue.push("Hello")
        queue.push("world")
        queue.push("You!")

        let item = queue.pop()
        print("===== item: \(item)=====")
        XCTAssertEqual("Hello", item)
    }

}
