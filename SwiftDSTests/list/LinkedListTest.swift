//
//  LinkedListTest.swift
//  SwiftDSTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class LinkedListTest: XCTestCase {

    func testPrepend() {
        let input = [1,2,3,4,5,6,7]
        let list = LinkedList<Int>()
        for i in input {
            list.prepend(value: i)
        }
        print("===== print Standard =====")
        list.printList()
        print("===== print Reverse =====")
        list.printReverseList()
    }

    func testAppend() {
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

    func testDeleteBasic() {
        let input = [1,2,3,4,5,6,7]
        testDeleteWork(input: input, value: 2)
    }

    func testDeleteAtTail() {
        let input = [1,2,3,4,5,6,7]
        testDeleteWork(input: input, value: 7)
    }

    func testDeleteAtHead() {
        let input = [1,2,3,4,5,6,7]
        testDeleteWork(input: input, value: 1)
    }

    private func testDeleteWork(input: [Int], value: Int) {
        let list = LinkedList<Int>(input: input)
        print("===== print =====")
        list.printList()
        let deleted = list.delete(value: value)
        XCTAssertTrue(deleted, "Failed to delete")
        print("===== print after delete =====")
        list.printList()
    }

    func testCustomList01() {
        let list = LinkedList<BasicEntry>()
        let node = BasicEntry("Kawaki", 10)
        list.append(value: BasicEntry("Naruto", 1))
        list.append(value: BasicEntry("Sasuke", 2))
        list.append(value: BasicEntry("Sakura", 3))
        list.append(value: BasicEntry("Jiraya", 4))
        list.append(value: BasicEntry("Boruto", 5))
        list.append(value: node)
        list.append(value: BasicEntry("Sarada", 6))

        let deleted = list.delete(value: node)
        XCTAssertTrue(deleted, "Failed to delete this node")
        printBasicEntry(list)
        XCTAssertEqual(list.size, 6, "Failed to assert list size")
    }

    private func printBasicEntry(_ list: LinkedList<BasicEntry>) {
        var cur = list.head
        while(cur != nil) {
            let value = cur!.value
            let name = String(describing: value.name)
            let id = value.id
            print("====== name: \(name) ===== id: \(id) ======")
            cur = cur?.next
        }
    }

}
