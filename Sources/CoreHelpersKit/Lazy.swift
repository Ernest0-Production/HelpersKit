//
//  File.swift
//  
//
//  Created by Ernest Babayan on 29.06.2021.
//


@dynamicMemberLookup
public final class Lazy<Value> {
    private let builder: () -> Value
    public private(set) lazy var value: Value = builder()
    
    public init(_ builder: @escaping @autoclosure () -> Value) {
        self.builder = builder
    }
    
    public subscript<Propery>(dynamicMember keyPath: KeyPath<Value, Propery>) -> Propery {
        value[keyPath: keyPath]
    }
}
