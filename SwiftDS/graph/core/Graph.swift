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
            throw GraphError.noRootNodeFound
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
                    queue.push(v)
                    v.isVisited = true
                }
            }
        }
        return false
    }
}
