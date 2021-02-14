//
//  Graph.swift
//  SwiftDS
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

public class Graph {
    public var verticesMap : Dictionary<String, Vertex<String>> = [:]
    public init(map: Dictionary<String, Vertex<String>> = [:]) {
        self.verticesMap = map
    }

    public init(docFileDir: String, fileName: String) {
        self.verticesMap = GraphUtils.parseGraphJsonFile(inputDirectory: docFileDir, fileName: fileName)
    }

    func bfsSearch(key: String) throws -> Bool {
        if verticesMap.isEmpty {
            return false
        }
        let srcId = verticesMap.keys.first!
        return try bfsSearch(root: srcId, key: key)
    }

    func bfsSearch(root: String, key: String) throws -> Bool {
        guard let src = verticesMap[root] else {
            throw GraphError.noNodeFound
        }

        let queue = Queue<Vertex<String>>()
        queue.push(src)
        src.isVisited = true

        while queue.size() != 0 {
            let cur = queue.pop()
            if cur.id == key {
                return true
            }

            let neighbors = cur.edgeList
            for neighbor in neighbors {
                let nid = neighbor.y
                guard let v = verticesMap[nid] else {
                    throw GraphError.noNodeFound
                }

                if !v.isVisited {
                    print("[\(v.id)] ", terminator: " ")
                    queue.push(v)
                    v.isVisited = true
                }
            }
        }
        return false
    }

    func dfsSearch(key: String) throws -> Bool {
        let srcId = verticesMap.keys.first!
        return try dfsSearch(root: srcId, key: key)
    }

    func dfsSearch(root: String, key: String) throws -> Bool {
        guard let src = verticesMap[root] else {
            throw GraphError.noNodeFound
        }
        src.isVisited = true

        let stack = Stack<Vertex<String>>()
        stack.push(src)

        while stack.size() != 0 {
            let cur = stack.pop()
            let neighbors = cur.edgeList
            for neighbor in neighbors {
                let nid = neighbor.y
                let v = verticesMap[nid]!
                if v.id == key {
                    return true
                }

                if !v.isVisited {
                    print("[\(v.id)] ", terminator: " ")
                    stack.push(v)
                    v.isVisited = true
                }
            }
        }

        return false
    }
}
