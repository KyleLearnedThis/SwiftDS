//
//  LinkedList.swift
//  SwiftExercises
//
//  Copyright © 2018 kylelearnedthis. All rights reserved.
//

import Foundation

class LinkedList<T: Comparable> {
    var head: Node<T>? = nil
    var tail: Node<T>? = nil

    init(input: Array<T>) {
        for i in input {
            let n = Node<T>(value: i)
            add(node: n)
        }
    }

    public func add(node: Node<T>) {
        if head == nil {
            head = node
            tail = node
        } else {
            tail!.next = node
            node.prev = tail
            tail = node
        }
    }

    public func search(searchValue: T) -> Node<T>? {
        var cur = head
        while cur != nil {
            let n = cur?.getValue()
            if searchValue == n {
                return cur
            } else {
                cur = cur?.next
            }
        }
        return nil
    }

    public func printList() {
        var cur: Node<T>! = head
        while(cur != nil) {
            print("\([cur.value]) ")
            cur = cur!.next
        }
    }

    public func printReverseList() {
        var cur: Node<T>! = tail
        while(cur != nil) {
            print("\([cur.value]) ")
            cur = cur!.prev
        }
    }
}
