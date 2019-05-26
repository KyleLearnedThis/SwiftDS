//
//  Node.swift
//  SwiftExercises
//
//  Copyright © 2018 kylelearnedthis. All rights reserved.
//

import Foundation

public class Node<T> {
    var value: T
    public func getValue() -> T {
        return self.value
    }
    public func setValue(x: T) {
        self.value = x
    }
    
    public var prev: Node<T>? = nil
    public var next: Node<T>? = nil
    init(value: T) {
        self.value = value
    }
}
