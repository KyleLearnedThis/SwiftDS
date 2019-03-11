//
//  BaseSort.swift
//  SwiftDS
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

public class BaseSort {

    var input: [Int]

    init(input: [Int] = []) {
        self.input = input
    }

    public func print() {
        Swift.print("[", terminator: " ")
        for i in input {
            Swift.print(i, terminator: " ")
        }
        Swift.print("]")
    }
}
