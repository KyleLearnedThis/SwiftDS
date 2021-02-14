//
//  GraphTest.swift
//  SwiftDSTests
//
//  Created by KyleLearnedThis on 2/12/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class GraphTest: XCTestCase {

    func testBFS() throws {
        let dir = "dev/iOS/SwiftDS/SwiftDSTests/graph/resources/"
        let fileName = "test01.json"
        let graph = Graph(docFileDir: dir, fileName: fileName)
        let starCity = "San Francisco"
        let searchCity = "Miami"
        let expected = true
        let actual = try graph.bfsSearch(root: starCity, key: searchCity)
        XCTAssertEqual(actual, expected, "Expected to find \(searchCity) but is not found")
    }

    func testDFS() throws {
        let dir = "dev/iOS/SwiftDS/SwiftDSTests/graph/resources/"
        let fileName = "test01.json"
        let graph = Graph(docFileDir: dir, fileName: fileName)
        let startCity = "San Francisco"
        let searchCity = "Miami"
        let expected = true
        let actual = try graph.dfsSearch(root: startCity, key: searchCity)
        XCTAssertEqual(actual, expected, "Expected to find \(searchCity) but is not found")
    }
}
