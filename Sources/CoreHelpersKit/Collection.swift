//
//  File.swift
//  
//
//  Created by Ernest Babayan on 14.05.2021.
//


public extension Collection {
    subscript (safe index: Index) -> Element? {
        indices.contains(index).map(onTrue: self[index], onFalse: nil)
    }

    func skipNil<Wrapped>() -> [Wrapped] where Element == Wrapped? {
        compactMap({ $0 })
    }
}
