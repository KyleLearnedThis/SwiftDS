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

    func bfsSearch(key: String) throws -> Vertex<String>? {
        if verticesMap.isEmpty {
            return nil
        }
        let srcId = verticesMap.keys.first!
        return try bfsSearch(root: srcId, key: key)
    }

    func bfsSearch(root: String, key: String) throws -> Vertex<String>? {
        guard let src = verticesMap[root] else {
            throw GraphError.noNodeFound
        }

        let queue = Queue<Vertex<String>>()
        queue.push(src)

        while queue.size() != 0 {
            let cur = queue.pop()
            cur.isVisited = true

            if cur.id == key {
                return cur
            }

            for edge in cur.edgeList {
                let id = edge.y
                guard let neighbor = verticesMap[id] else {
                    throw GraphError.noNodeFound
                }

                if !neighbor.isVisited {
                    queue.push(neighbor)
                    neighbor.cost = cur.cost + 1
                }
            }
        }
        return nil
    }

    func dfsSearch(key: String) throws -> Vertex<String>? {
        let srcId = verticesMap.keys.first!
        return try dfsSearch(root: srcId, key: key)
    }

    func dfsSearch(root: String, key: String) throws -> Vertex<String>? {
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
                    return v
                }

                if !v.isVisited {
                    stack.push(v)
                    v.isVisited = true
                }
            }
        }

        return nil
    }
}
