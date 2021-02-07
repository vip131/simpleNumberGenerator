//
//  Extensions.swift
//  simpleNumberGenerator
//
//  Created by Admin on 06.02.2021.
//  Copyright © 2021 DmitryChaschin. All rights reserved.
//

import Foundation

//MARK: - Array splitter ext -
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
