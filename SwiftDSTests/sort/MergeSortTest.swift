//
//  MergeSortTest.swift
//  SwiftDSTests
//
//  Created by KyleLearnedThis on 2/16/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class MergeSortTest: XCTestCase {

    func testBasic() throws {
        let input = [9,8,7,6,5,4,3,2,1]
        let expected = [1,2,3,4,5,6,7,8,9]
        let ms = MergeSort(input)
        let actual = ms.sort()
        ms.printAll()
        XCTAssertEqual(actual, expected)
    }

}
