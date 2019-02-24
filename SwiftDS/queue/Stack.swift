//
//  Stack.swift
//  SwiftExercisesTests
//
//  Copyright © 2018 kylelearnedthis. All rights reserved.
//

import Foundation

public class Stack<T: Comparable> {
    var stack : [T]

    public init() {
        stack = [T]()
    }

    public func push(_ item: T) {
        stack.append(item)
    }

    public func pop() -> T {
        let item = stack.removeLast()
        return item
    }

    public func size() -> Int {
        return stack.count
    }
}
