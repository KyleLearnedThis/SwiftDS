//
//  LRUCache.swift
//  SwiftDS
//
//  Created by KyleLearnedThis on 1/29/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import Foundation

// Used implementation of https://github.com/raywenderlich/swift-algorithm-club
class LRUCache<T: Comparable> where T: Hashable {
    var capacity = 0
    var queue: LinkedList<T> = LinkedList<T>()
    var cache: [T: Any] = [:]
    var nodes: [T: Node<T>] = [:]

    init(capacity: Int = 0) {
        self.capacity = capacity
    }

    public func get(_ key: T) -> Any? {
        guard let val = cache[key] else {
            return nil
        }
        remove(key)
        insert(key, val: val)
        return val
    }

    public func set(_ key: T, val: Any) {
        if cache[key] != nil {
            remove(key)
        } else if queue.size >= capacity, let keyToRemove = queue.tail?.value {
            remove(keyToRemove)
        }
        insert(key, val: val)
    }

    private func insert(_ key: T, val: Any) {
        cache[key] = val
        let first = Node<T>(value: key)
        queue.prepend(node: first)
        nodes[key] = first
    }

    private func remove(_ key: T) {
        cache.removeValue(forKey: key)
        guard let node = nodes[key] else { return }
        _ = queue.delete(node: node)
        nodes.removeValue(forKey: key)
    }
}
