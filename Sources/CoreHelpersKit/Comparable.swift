//
//  File.swift
//  
//
//  Created by Ernest Babayan on 07.08.2021.
//

import Foundation


public extension Comparable {
    func isLess(then another: Self) -> Bool { self < another }
    
    func isLessOrEqual(then another: Self) -> Bool { self <= another }
    
    func isGreater(then another: Self) -> Bool { self > another }
    
    func isGreaterOrEqual(then another: Self) -> Bool { self >= another }
}
