//
//  TreeNode.swift
//  SwiftExercises
//
//  Copyright © 2018 kylelearnedthis. All rights reserved.
//

import Foundation

class TreeNode<T> {
    var data: T
    var left: TreeNode?
    var right: TreeNode?

    init(data: T,
        leftNode: TreeNode? = nil,
        rightNode: TreeNode? = nil) {
        self.data = data
        self.left = leftNode
        self.right = rightNode
    }
}
