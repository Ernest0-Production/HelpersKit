//
//  File.swift
//  
//
//  Created by Ernest Babayan on 03.06.2021.
//

import Foundation


public extension NSObjectProtocol {
    func transform<T>(_ selfTransform: (Self) -> T) -> T {
        selfTransform(self)
    }
}

public extension NSObjectProtocol where Self: AnyObject {
    func transform(_ selfTransform: (Self) -> Void) -> Self {
        selfTransform(self)
        return self
    }
}
