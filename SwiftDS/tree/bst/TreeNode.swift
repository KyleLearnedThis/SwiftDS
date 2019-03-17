//
//  TreeNode.swift
//  SwiftExercises
//
//  Copyright © 2018 kylelearnedthis. All rights reserved.
//

import Foundation

public class TreeNode<T> {
    open var data: T
    open var left: TreeNode?
    open var right: TreeNode?

    public init(data: T,
        leftNode: TreeNode? = nil,
        rightNode: TreeNode? = nil) {
        self.data = data
        self.left = leftNode
        self.right = rightNode
    }
}
