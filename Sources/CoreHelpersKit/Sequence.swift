//
//  File.swift
//  
//
//  Created by Ernest Babayan on 22.05.2021.
//

public extension Sequence {
    ///  ~~~
    /// [1,2,3,4,4,5].transform(to: Set.init)
    /// requests.transform(to: Single.zip)
    ///  ~~~
    func transform<T>(to selfTransform: (Self) -> T) -> T { selfTransform(self) }
    
    /// forEach + return self
    func `do`(_ body: (Element) throws -> Void) rethrows -> Self {
        try forEach(body)
        return self
    }
}
