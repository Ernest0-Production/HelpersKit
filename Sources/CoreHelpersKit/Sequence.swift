//
//  File.swift
//  
//
//  Created by Ernest Babayan on 22.05.2021.
//

public extension Sequence {
    ///  ~~~
    /// [1,2,3,4,4,5].transform(Set.init)
    /// requests.transform(Single.zip)
    ///  ~~~
    func transform<T>(_ selfTransform: (Self) -> T) -> T { selfTransform(self) }
    
    /// forEach + return self
    func `do`(_ body: (Element) throws -> Void) rethrows -> Self {
        try forEach(body)
        return self
    }
}
