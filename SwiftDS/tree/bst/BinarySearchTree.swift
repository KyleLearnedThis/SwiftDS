//
//  BinarySearchTree.swift
//  SwiftExercises
//
//  Copyright © 2018 kylelearnedthis. All rights reserved.
//

import Foundation

public class BinarySearchTree<T: Comparable> {
    var root : TreeNode<T>? = nil

    init() {
        root = nil
    }

    public init(input: Array<T>) {
        insert(input: input)
    }

    func insert(input: Array<T>) {
        for i in input {
            insert(element: i)
        }
    }

    func insert(element: T) {
        let node = TreeNode(data: element)
        if let rootNode = self.root {
            self.insertWork(rootNode, node)
        } else {
            self.root = node
        }
    }
    
    private func insertWork(_ currentNode: TreeNode<T>, _ node: TreeNode<T>) {
        let cur = currentNode
        
        if currentNode.data > node.data {
            if let leftNode = cur.left {
                self.insertWork(leftNode, node)
            } else {
                cur.left = node
            }
        } else {
            if let right = cur.right {
                self.insertWork(right, node)
            } else {
                cur.right = node
            }
        }
    }

    public func search(searchValue: T) -> TreeNode<T>? {
        var cur = root
        while(cur != nil) {
            if searchValue == cur?.data {
                return cur
            } else if searchValue > (cur?.data)! {
                cur = cur?.right
            } else {
                cur = cur?.left
            }
        }
        return nil
    }
    
    public func printPreOrder() {
        preOrder(node: root)
        print("")
    }

    func preOrder(node: TreeNode<T>?) {
        if node == nil {
            return
        }
        if let value = node?.data {
            print(value, terminator: " ")
        }
        preOrder(node: node?.left)
        preOrder(node: node?.right)
    }
    
    public func printInOrder() {
        inOrder(node: root)
        print("")
    }

    func inOrder(node: TreeNode<T>?) {
        if node == nil {
            return
        }
        inOrder(node: node?.left)
        if let value = node?.data {
            print(value, terminator: " ")
        }
        inOrder(node: node?.right)
    }

    public func printPostOrder() {
        postOrder(node: root)
        print("")
    }

    func postOrder(node: TreeNode<T>?) {
        if node == nil {
            return
        }
        postOrder(node: node?.left)
        postOrder(node: node?.right)
        if let value = node?.data {
            print(value, terminator: " ")
        }
    }

    public func maxLevel(node: TreeNode<T>?) -> Int {
        if(node != nil) {
            return max(maxLevel(node: node?.left), maxLevel(node: node?.right)) + 1
        } else {
            return 0
        }
    }

    public func getRoot() -> TreeNode<T>? {
        return root
    }
}
