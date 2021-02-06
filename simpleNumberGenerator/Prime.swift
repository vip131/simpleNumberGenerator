//
//  Prime.swift
//  simpleNumberGenerator
//
//  Created by Admin on 05.02.2021.
//  Copyright © 2021 DmitryChaschin. All rights reserved.
//

import Foundation

struct PrimeNumbers {
    
    static func generate(upperBound: Int = 100, from startNum: Int) -> [[Int]] {
        var eratosthenesSieve = Array.init(repeating: true,
                                           count: upperBound)
        var primes = [Int]()
        eratosthenesSieve[0] = false
        eratosthenesSieve[1] = false
        for i in startNum..<upperBound where eratosthenesSieve[i] == true {
            var j = i*i
            while j < upperBound {
                eratosthenesSieve[j] = false
                j += i
            }
            primes.append(i)
            
        }
       let primesArr = primes.chunked(into: 2)
        return primesArr
    }
}


