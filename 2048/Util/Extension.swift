//
//  Extension.swift
//  2048
//
//  Created by Furkan Kaynar on 5.05.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    func indexes(of element: Element) -> [Int] {
        return self.enumerated().filter({ element == $0.element }).map({ $0.offset })
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
    
    func transposed() -> [[Int]] {
        var transposedArray = [[Int]]()
        var array = self as! [[Int]]
        for i in stride(from: 0, to: self.count, by: 1)
        {
            var subArray = [Int]()
            for j in stride(from: 0, to: self.count, by: 1)
            {
                if array[j].count < array.count
                {
                    array[j].append(0)
                }
                subArray.append(array[j][i])
            }
            transposedArray.append(subArray)
        }
        return transposedArray
    }
}
