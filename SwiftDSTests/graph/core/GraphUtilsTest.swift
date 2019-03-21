//
//  GraphUtilsTest.swift
//  SwiftDSTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class GraphUtilsTest: XCTestCase {

    func testBasic() {
        let dir = "dev/iOS/SwiftDS/SwiftDSTests/graph/resources/"
        let fileName = "test02.json"
        let x = GraphUtils()
        _ = x.parseGraphJsonFile(inputDirectory: dir, fileName: fileName)
    }

}
