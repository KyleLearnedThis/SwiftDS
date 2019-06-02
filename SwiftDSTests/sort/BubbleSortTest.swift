//
//  BubbleSortTest.swift
//  SwiftDSTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class BubbleSortTest: XCTestCase {

    func testBasic() {
        let n: [Int] = [9,8,7,6,5]
        let x = BubbleSort(n)
        let result = x.sort()
        dump(result)
    }

}
