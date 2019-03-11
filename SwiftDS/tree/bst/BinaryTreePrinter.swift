//
//  BinaryTreePrinter.swift
//  SwiftDS
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

public class BinaryTreePrinter<T: Comparable> {

    public static func maxLevel(node: TreeNode<T>?) -> Int {
        if(node != nil) {
            return max(maxLevel(node: node?.left), maxLevel(node: node?.right)) + 1
        } else {
            return 0
        }
    }

    private static func printWhiteSpaces(count: Int) {
        if(count <= 0) {
            return
        }
        for _ in 0..<count {
            print(" ", terminator: " ")
        }
    }

    private static func isAllElementsNull(list: [TreeNode<T>?] ) -> Bool {
        for item in list {
            if(item != nil) {
                return false
            }
        }
        return true
    }

    public static func printNode(root: TreeNode<T>) {
        let maxLevel = BinaryTreePrinter.maxLevel(node: root)
        let list = [root]
        printNodeInternal(nodes: list, level: 1, maxLevel: maxLevel)
    }

    private static func printNodeInternal(nodes: [TreeNode<T>?], level: Int, maxLevel: Int) {

        if(nodes.isEmpty || BinaryTreePrinter.isAllElementsNull(list: nodes)){
            return
        }

        let floor = maxLevel - level
        let edgeLines = intValue(value: pow(2, max(floor - 1, 0)))
        let firstSpaces = intValue(value: pow(2, floor)) - 1
        let betweenSpaces = intValue(value: pow(2, floor + 1)) - 1
        printWhiteSpaces(count: firstSpaces)

        var newNodes: [TreeNode<T>?] = []
        for node in nodes {
            if(node != nil) {
                if let val = node?.data {
                    print(val, terminator: " ")
                }
                newNodes.append(node?.left)
                newNodes.append(node?.right)
            } else {
                newNodes.append(nil)
                newNodes.append(nil)
                print(" ", terminator: " ")
            }

            printWhiteSpaces(count: betweenSpaces)
        }
        print("")

        for i in 1...edgeLines {
            for j in 0..<nodes.count {
                printWhiteSpaces(count: firstSpaces - i)
                if(nodes[j] == nil) {
                    printWhiteSpaces(count: edgeLines + edgeLines + i + 1)
                    continue
                }

                if(nodes[j]?.left != nil) {
                    print("/", terminator: " ")
                } else {
                    printWhiteSpaces(count: 1)
                }

                printWhiteSpaces(count: i + i - 1)

                if(nodes[j]?.right != nil) {
                    print("\\", terminator: " ")
                } else {
                    printWhiteSpaces(count: 1)
                }

                printWhiteSpaces(count: edgeLines + edgeLines - i)
            }
            print("")
        }
        printNodeInternal(nodes: newNodes, level: level + 1, maxLevel: maxLevel);
    }

    private static func intValue(value: Decimal) -> Int {
        return NSDecimalNumber(decimal: value).intValue
    }
}
