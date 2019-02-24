//
//  StackTest.swift
//  SwiftDSTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class StackTest: XCTestCase {

    func testBasic() {
        let stack = Stack<String>()
        stack.push("Hello")
        stack.push("world")
        stack.push("You!")

        let item = stack.pop()
        print("===== item: \(item)=====")
        XCTAssertEqual("You!", item)
    }

}
