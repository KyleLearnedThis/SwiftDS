//
//  Queue.swift
//  SwiftExercises
//
//  Copyright © 2018 kylelearnedthis. All rights reserved.
//

import Foundation

public class Queue<T: Comparable> {
    var queue : [T]

    public init() {
        queue = [T]()
    }

    public func push(_ item: T) {
        queue.append(item)
    }

    public func pop() -> T {
        let item = queue.remove(at: 0)
        return item
    }

    public func size() -> Int {
        return queue.count
    }
}
