//
//  Numbers.swift
//  simpleNumberGenerator
//
//  Created by Admin on 05.02.2021.
//  Copyright © 2021 DmitryChaschin. All rights reserved.
//

import Foundation

class Number  {
    var isGray: Bool
    let numArr = randomNum()
    init(isGray: Bool) {
        self.isGray = isGray
    }
    
    
    
    
    class func randomNum() -> [String] {
        var arr = [String]()
        for _ in 0...100 {
            let randomInt = Int.random(in: 0...100)
            arr.append(String(randomInt))
        }
        return arr
        
    }
    
    
    
    
    
    
}
