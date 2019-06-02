//
//  QuickSortTest.swift
//  SwiftDSTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class QuickSortTest: XCTestCase {

    func testBasic() {
        let input = [9,8,7,6,5,4,3,2,1]
        let expected = [1,2,3,4,5,6,7,8,9]
        let qs = QuickSort(input)
        let actual = qs.sort()
        qs.printAll()
        XCTAssertEqual(actual, expected)
    }

}
