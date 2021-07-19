//
//  Dijstra.swift
//  SwiftDS
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

public class Dijkstra {
    var graph: Graph
    public init(inputDir: String, fileName: String) {
        graph = Graph(docFileDir: inputDir, fileName: fileName)
    }

    /**
        - parameters:
            - source: source ID as string
            - target: destination ID as string
        - returns:
            (Array of Vertex<String>, Final cost of reaching the target in Int)
     */
    public func findShortestDistance(source: String, target: String) -> ([Vertex<String>], Int) {
        initialize(source: source)

        var queue = PriorityQueue<Vertex<String>>()

        for (_, vertex)  in graph.verticesMap {
            queue.push(vertex)
        }

        while !queue.isEmpty {
            let u = queue.pop()!
            let cost = u.cost
            let edgeList = u.edgeList

            for edge in edgeList {
                let id = edge.y
                let weight = edge.weight
                var alt = 0
                if cost == Int.max {
                    alt = weight
                } else {
                    alt = cost + weight
                }

                let v = graph.verticesMap[id]!

                let neighborWeight = v.cost
                if alt < neighborWeight {
                    v.cost = alt
                    v.previous = u
                    refreshQueue(queue: queue, vertex: v)
                }
            }
        }

        var path: [Vertex<String>] = []
        var x = graph.verticesMap[target]
        let finalCost = x!.cost
        
        while x != nil {
            path.insert(x!, at: 0)
            x = x?.previous
        }

        return (path, finalCost)
    }

    func initialize(source: String) {
        for (id, vertex) in graph.verticesMap {
            if id == source {
                vertex.cost = 0
            } else {
                vertex.cost = Int.max
            }
            vertex.previous = nil
        }
    }

    /**
        Original priority queue does not rebalance the queue if you modify the item's weight.
        Trick is to reinsert the same item into the queue to preserve order.
        - parameters:
            - queue: priority queue
            - vertex: element in queue that changed weight after insertion
     */
    func refreshQueue(queue: PriorityQueue<Vertex<String>>, vertex: Vertex<String>) {
        var q = queue
        for v in q {
            if vertex.id == v.id {
                q.remove(v)
                q.push(v)
            }
        }
    }
}
