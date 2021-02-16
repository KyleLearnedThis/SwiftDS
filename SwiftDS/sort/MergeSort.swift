//
//  MergeSort.swift
//  SwiftDS
//
//  Created by KyleLearnedThis on 2/16/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  http://www.thomashanning.com/merge-sort-in-swift/

import Foundation

class MergeSort: BaseSort {
    func sort() -> [Int] {
        self.input = mergeSort(array: self.input)
        return self.input
    }

    func mergeSort(array: [Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }

        let mid = array.count / 2
        let left = Array(array[0 ..< mid])
        let right = Array(array[mid ..< array.count])

        return merge(left: mergeSort(array: left), right: mergeSort(array: right))
    }

    func merge(left: [Int], right: [Int]) -> [Int] {
        var mergedList = [Int]()
        var left = left
        var right = right

        while left.count > 0 && right.count > 0 {
            if left.first! < right.first! {
                mergedList.append(left.removeFirst())
            } else {
                mergedList.append(right.removeFirst())
            }
        }

        return mergedList + left + right
    }
}
