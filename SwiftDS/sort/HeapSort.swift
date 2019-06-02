//
//  HeapSort.swift
//  SwiftDS
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

class HeapSort: BaseSort{
    func sort() -> [Int] {
        let n = input.count
        for i in (0..<n/2).reversed() {
            heapify(&input, n, i)
        }

        for j in (0..<n).reversed() {
            input.swapAt(j, 0)
            heapify(&input, j, 0)
        }
        return input
    }

    func heapify(_ arr: inout [Int], _ n: Int, _ i: Int) {
        var largest = i
        let l = 2 * i + 1
        let r = 2 * i + 2

        if l < n && arr[l] > arr[largest] {
            largest = l
        }

        /// If right child is larger than largest so far
        if r < n && arr[r] > arr[largest] {
            largest = r
        }

        /// If largest is not root
        if (largest != i) {
            arr.swapAt(i, largest)
            // Recursively heapify the affected sub-tree
            heapify(&arr, n, largest)
        }
    }
}
