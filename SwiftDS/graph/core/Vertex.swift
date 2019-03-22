//
//  Vertex.swift
//  SwiftDS
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

public class Vertex<T: Comparable> : Comparable {
    
    public static func < (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        return lhs.cost > rhs.cost
    }

    public static func == (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        return lhs.cost == rhs.cost
    }
    
    public var id: T
    public var edgeList = Array<Edge<T>>()
    public var isVisited: Bool = false
    public var cost: Int
    public var previous: Vertex<T>?

    public init(id: T, edgeList: Array<Edge<T>> = [], isVisited: Bool = false, cost: Int = 0, previous: Vertex<T>? = nil) {
        self.id = id
        self.edgeList = []
        self.isVisited = false
        self.cost = 0
        self.previous = nil
    }
}
