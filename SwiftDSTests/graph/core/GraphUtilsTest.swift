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
        _ = GraphUtils.parseGraphJsonFile(inputDirectory: dir, fileName: fileName)
    }

}
