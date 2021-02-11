//
//  Prime.swift
//  simpleNumberGenerator
//
//  Created by Admin on 05.02.2021.
//  Copyright © 2021 DmitryChaschin. All rights reserved.
//

import Foundation

struct PrimeNumbers {
    
    static func generate(upperBound: Int = 100, from startNum: Int) -> [Int] {
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
        return primes
    }
    
    
    //Another work method
    static func findPrimeNumberlist(fromNumber:Int, toNumber: Int) -> [Int] {
        var primes = [Int]()
        for i in (fromNumber + 1)...toNumber
        {
            var isPrime = true
            if i <= 1 { // number must be positive integer
                isPrime = false
            }
            else if i <= 3 {
                isPrime = true
            }
            else {
                for j in 2...i/2 // here i am using loop from 2 to i/2 because it will reduces the  iteration.
                {
                    if i%j == 0 { // number must have only 1 factor except 1. so use break: no need to check further
                        isPrime = false
                        break
                    }
                }
            }
            if isPrime  {
                primes.append(i)
            }
        }
        return primes
    }
    
}


