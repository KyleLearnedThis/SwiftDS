//
//  QuickSort.swift
//  SwiftDS
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class QuickSort: BaseSort {
    func sort() -> [Int] {
        if input.isEmpty {
            return input
        }
        quickSort(low: 0, high: input.count - 1)
        return input
    }

    func quickSort(low: Int, high: Int) {
        var i = low
        var j = high
        let pivotIndex = low + (high - low) / 2
        let pivotValue = input[pivotIndex]

        while i <= j {
            while (input[i] < pivotValue) {
                i = i + 1
            }
            while (input[j] > pivotValue) {
                j = j - 1
            }

            if (i <= j) {
                input.swapAt(i, j)
                i = i + 1
                j = j - 1
            }
        }
    }
}
