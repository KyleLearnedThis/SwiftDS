//
//  HeapSortTest.swift
//  SwiftDSTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class HeapSortTest: XCTestCase {

    func testBasic() {
        let input = [9,8,7,6,5,4,3,2,1]
        let expected = [1,2,3,4,5,6,7,8,9]
        let hs = HeapSort(input)
        let actual = hs.sort()
        hs.printAll()
        XCTAssertEqual(actual, expected)
    }

}
