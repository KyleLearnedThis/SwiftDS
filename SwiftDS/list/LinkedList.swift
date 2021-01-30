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
    var size = 0

    public func getHead() -> Node<T>? {
        return self.head
    }

    public func getTail() -> Node<T>? {
        return self.tail
    }
    public init(input: Array<T> = []) {
        for i in input {
            let n = Node<T>(value: i)
            append(node: n)
        }
    }

    public func append(node: Node<T>) {
        if head == nil {
            head = node
            tail = node
        } else {
            tail!.next = node
            node.prev = tail
            tail = node
        }
        self.size += 1
    }

    public func append(value: T) {
        let node = Node<T>(value: value)
        append(node: node)
    }

    func prepend(node: Node<T>) {
        guard self.head != nil else {
            self.head = node
            self.tail = node
            self.size += 1
            return
        }

        self.head?.prev = node
        node.next = self.head
        self.head = node

        self.size += 1
    }

    func prepend(value: T) {
        let node = Node<T>(value: value)
        prepend(node: node)
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

    public func delete(node: Node<T>?) -> Bool {
        if node != nil {
            let prev = node?.prev
            let next = node?.next

            if let prev = prev {
                prev.next = next
            } else {
                head = next
            }
            next?.prev = prev

            node?.prev = nil
            node?.next = nil
            self.size -= 1
            return true
        } else {
            return false
        }
    }

    public func delete(value: T) -> Bool {
        if let node = search(searchValue: value) {
            let prev = node.prev
            let next = node.next

            if let prev = prev {
                prev.next = next
            } else {
                head = next
            }
            next?.prev = prev

            node.prev = nil
            node.next = nil
            self.size -= 1
            return true
        } else {
            return false
        }
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
