//
//  EratosthenesSieveTest.swift
//  SwiftDSTests
//
//  Created by KyleLearnedThis on 12/9/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//

import XCTest

class EratosthenesSieveTest: XCTestCase {

    func testBasic() throws {
        let n = 20
        let expected = [2, 3, 5, 7, 11, 13, 17, 19]
        let actual = EratosthenesSieve.sieveOfEratosthenes(n)
        let equal = expected.elementsEqual(actual)
        XCTAssertTrue(equal)
    }

}
