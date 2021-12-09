//
//  EratosthenesSieve.swift
//  SwiftDS
//
//  Created by KyleLearnedThis on 12/9/21.
//  Copyright © 2021 kylelearnedthis. All rights reserved.
//  https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes

import Foundation

class EratosthenesSieve {
    static func sieveOfEratosthenes(_ n: Int) -> [Int] {
        var result = [Int]()

        // This is a basic solution, not mean to handle if n is large due to memory usage.
        if n >= 1024 {
            return result
        }

        var prime = Array<Bool>(repeating: true, count: n+1)
        var p = 2
        while p * p <= n {
            if prime[p] {
                var i = p * p
                while i <= n {
                    prime[i] = false
                    i += p
                }
            }
            p += 1
        }

        for i in 2 ..< n {
            if prime[i] {
                result.append(i)
            }
        }
        return result
    }
}
