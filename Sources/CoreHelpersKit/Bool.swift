//
//  File.swift
//  
//
//  Created by Ernest Babayan on 20.05.2021.
//

public extension Bool {
    var isFalse: Bool { !self }
    
    var isTrue: Bool { self }
    
    func map<T>(
        onTrue: () throws -> T,
        onFalse: () throws -> T
    ) rethrows -> T {
        if self { return try onTrue() }
        else { return try onFalse() }
    }
    
    func map<T>(
        onTrue: @autoclosure () throws -> T,
        onFalse: @autoclosure () throws -> T
    ) rethrows -> T {
        try map(onTrue: onTrue, onFalse: onFalse)
    }
}
