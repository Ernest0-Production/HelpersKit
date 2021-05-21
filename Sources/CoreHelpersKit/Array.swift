//
//  File.swift
//  
//
//  Created by Ernest Babayan on 14.05.2021.
//


public extension Array {
    @discardableResult
    func appending(_ elements: Element...) -> Self {
        var copy = self
        copy.append(contentsOf: elements)
        return copy
    }

    @discardableResult
    func appending(_ elements: [Element]) -> Self {
        var copy = self
        copy.append(contentsOf: elements)
        return copy
    }

    var lastIndex: Int { endIndex - 1 }
    
    init(@ArrayBuilder<Element> _ builder: () -> [Element]) {
        self = builder()
    }
    
    @discardableResult
    func appending(@ArrayBuilder<Element> _ builder: () -> [Element]) -> Self {
        var copy = self
        copy.append(contentsOf: builder())
        return copy
    }
}
