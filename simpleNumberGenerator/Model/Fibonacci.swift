//
//  Fibonacci.swift
//  simpleNumberGenerator
//
//  Created by Admin on 07.02.2021.
//  Copyright © 2021 DmitryChaschin. All rights reserved.
//

import Foundation

struct Fibonacci {
    
    static func getFibonacciArray(fromStartInt: Bool, to endInt: Int ,with lastTwoNumbs: [Int]?) -> [[Int]]? {
        var resultArr = [Int]()
        
        if fromStartInt  {
            let startArr = [0,1]
            resultArr.append(contentsOf: startArr)
            for i in 0 ..< endInt - 2 {
                let nextNum = resultArr[i] + resultArr.last!
                resultArr.append(nextNum)
            }
            
        } else if !fromStartInt {
            guard let lastNumbs = lastTwoNumbs else { return nil}
            if lastNumbs.count == 2 {
                let startArr = [lastNumbs[0], lastNumbs[1]]
                resultArr.append(contentsOf: startArr)
                for i in 0 ..< endInt - 2 {
                    //Int overflow handling &+
                    let nextNum = resultArr[i] &+ resultArr.last!
                    resultArr.append(nextNum)
                }
            }
        }
        let chunkedArr = resultArr.chunked(into: 2)
        return chunkedArr
        
    }
    
    //       func fibonacci(n: Int) {
    //          var fibArray = [0,1]
    //           for i in 0 ..< n - 2 {
    //               let nextNum = fibArray[i] + fibArray.last!
    //               fibArray.append(nextNum)
    //           }
    //           print(fibArray)
    //       }
    
    
}
