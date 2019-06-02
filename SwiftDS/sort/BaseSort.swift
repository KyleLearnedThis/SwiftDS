//
//  BaseSort.swift
//  SwiftDS
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

public class BaseSort {

    var input: [Int]

    init(_ input: [Int] = []) {
        self.input = input
    }

    public func printAll() {
        print("[", terminator: " ")
        for i in input {
            print(i, terminator: " ")
        }
        print("]")
    }
}
