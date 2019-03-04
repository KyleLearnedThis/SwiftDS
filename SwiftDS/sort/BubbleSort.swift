//
//  BubbleSort.swift
//  SwiftDS
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

public class BubbleSort: BaseSort, Sorter {

    func sort() -> [Int] {
        for i in 0..<input.count {
            for j in 1..<input.count-i {
                if(input[j] < input[j-1]) {
                    let tmp = input[j-1]
                    input[j-1] = input[j]
                    input[j] = tmp
                }
            }
        }
        return input
    }

}
