//
//  Edge.swift
//  SwiftDS
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

public class Edge<T: Comparable> {
    public var x: T
    public var y: T
    var weight: Int
    var direction = Direction.BOTH

    public init(x: T, y: T, weight: Int = -1, direction: Direction = Direction.BOTH) {
        self.x = x
        self.y = y
        self.weight = weight
    }
}
