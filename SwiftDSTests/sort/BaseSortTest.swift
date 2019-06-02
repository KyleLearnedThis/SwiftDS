//
//  BaseSortTest.swift
//  SwiftDSTests
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import XCTest

class BaseSortTest: XCTestCase {

    var sort = BaseSort()

    func testBasic() {
        let n: [Int] = [9,8,7,6,5]
        sort.input = n
        sort.printAll()
    }

}
