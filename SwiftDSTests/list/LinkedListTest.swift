//
//  LinkedListTest.swift
//  SwiftDSTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class LinkedListTest: XCTestCase {

    func testAdd() {
        let input = [1,2,3,4,5,6,7]
        let list = LinkedList<Int>(input: input)
        print("===== print Standard =====")
        list.printList()
        print("===== print Reverse =====")
        list.printReverseList()
    }

    func testSearch() {
        let input = [1,2,3,4,5,6,7]
        let list = LinkedList<Int>(input: input)
        let node = list.search(searchValue: 7)
        XCTAssertNotNil(node)
        if let value = node?.getValue() {
            print("===== value: \(value) =====")
        }
    }

}
