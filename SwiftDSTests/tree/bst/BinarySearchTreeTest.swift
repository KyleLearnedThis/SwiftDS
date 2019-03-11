//
//  BinarySearchTreeTest.swift
//  SwiftDSTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class BinarySearchTreeTest: XCTestCase {

    func testPreOrder() {
        let input = [15, 6, 18, 3, 7, 17, 20, 2, 4, 13, 9]
        let bst = BinarySearchTree<Int>(input: input)
        bst.printPreOrder()
        BinaryTreePrinter.printNode(root: bst.getRoot()!)
    }

    func testInOrder() {
        let input = [15, 6, 18, 3, 7, 17, 20, 2, 4, 13, 9]
        let bst = BinarySearchTree<Int>(input: input)
        bst.printInOrder()
        BinaryTreePrinter.printNode(root: bst.getRoot()!)
    }

    func testPostOrder() {
        let input = [15, 6, 18, 3, 7, 17, 20, 2, 4, 13, 9]
        let bst = BinarySearchTree<Int>(input: input)
        bst.printPostOrder()
        BinaryTreePrinter.printNode(root: bst.getRoot()!)
    }

    func testSearch() {
        let input = [15, 8, 30, 4, 10, 20, 40]
        let bst = BinarySearchTree<Int>(input: input)
        BinaryTreePrinter.printNode(root: bst.getRoot()!)
        let seek = 40
        let actual = bst.search(searchValue: seek)

        if let value = actual?.data {
            print("===== seek node's data is \(value) =====")
        }
        XCTAssertNotNil(actual)
    }

}
