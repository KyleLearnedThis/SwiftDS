//
//  LinkedList.swift
//  SwiftExercises
//
//  Copyright © 2018 kylelearnedthis. All rights reserved.
//

import Foundation

public class LinkedList<T: Comparable> {
    var head: Node<T>? = nil
    var tail: Node<T>? = nil

    public func getHead() -> Node<T>? {
        return self.head
    }

    public func getTail() -> Node<T>? {
        return self.tail
    }
    public init(input: Array<T> = []) {
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
            print("\([cur.value])", terminator: " ")
            cur = cur!.next
        }
        print("")
    }

    public func printReverseList() {
        var cur: Node<T>! = tail
        while(cur != nil) {
            print("\([cur.value])", terminator: " ")
            cur = cur!.prev
        }
        print("")
    }
}
