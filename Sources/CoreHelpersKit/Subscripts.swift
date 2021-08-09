//
//  File.swift
//  
//
//  Created by Ernest Babayan on 07.08.2021.
//


public extension Collection {
    func value(at index: Index) -> Element { self[index] }
}

public extension Dictionary {
    func value(at key: Key) -> Value? { self[key] }
}
