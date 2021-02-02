//
//  LFUCache.swift
//  SwiftDS
//
//  Created by KyleLearnedThis on 2/1/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import Foundation

class LFUCache<T: Comparable> {
    var capacity = 0
    var queue: PriorityQueue<LFUMapEntry<T>>
    var entryMap: [Int : LFUMapEntry<T>] = [:]

    init(capacity: Int) {
        self.capacity = capacity
        self.queue = PriorityQueue<LFUMapEntry<T>>(ascending: true)
    }

    init(capacity: Int, queue: PriorityQueue<LFUMapEntry<T>>) {
        self.capacity = capacity
        self.queue = queue
    }

    @discardableResult
    func get(key: Int) -> T? {
        if let cacheEntry = entryMap[key] {
            cacheEntry.entry.incrementFrequency()
            queue.remove(cacheEntry)
            queue.push(cacheEntry)
            entryMap[key] = cacheEntry
            return cacheEntry.entry.data
        } else {
            return nil
        }
    }

    // Assume if an item with same key already existed, adding it again is a get()
    func add(key: Int, data: T) {
        if entryMap[key] != nil {
            _ = get(key: key)
        } else {
            if isFull {
                // Purge the least used item.
                // note there's a 1-to-1 mapping to items on queue and map
                let v = queue.pop()!
                let removeKey = v.key
                entryMap.removeValue(forKey: removeKey)
            }
            let item = LFUCacheItem(data: data, frequency: 1)
            let entry = LFUMapEntry<T>(key: key, entry: item)
            queue.push(entry)
            entryMap[key] = entry
        }
    }

    var isFull: Bool {
        entryMap.count == capacity
    }
}
