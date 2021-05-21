//
//  File.swift
//  
//
//  Created by Ernest Babayan on 14.05.2021.
//


public extension Optional {
    func `do`(_ body: (Self) throws -> Void) rethrows -> Self {
        try body(self)
        return self
    }
    
    func ifNotNil(_ execute: (Wrapped) -> Void) { flatMap(execute) }

    func unwrap(or fallback: @autoclosure () -> Wrapped) -> Wrapped {
        if let wrapped = self { return wrapped }
        else { return fallback() }
    }
    
    var isNil: Bool { self == nil }

    var isNotNil: Bool { self != nil }
}

public extension Optional where Wrapped: Sequence {
    var orEmpty: [Wrapped.Element] { map(Array.init).unwrap(or: []) }
}

public extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool { self.map(\.isEmpty).unwrap(or: true) }
    
    var orEmpty: String { unwrap(or: "") }
}
