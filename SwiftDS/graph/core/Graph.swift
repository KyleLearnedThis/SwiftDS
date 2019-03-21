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

}
