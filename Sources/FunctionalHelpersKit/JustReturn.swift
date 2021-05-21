//
//  File.swift
//  
//
//  Created by Ernest Babayan on 14.05.2021.
//

/// ~~~
/// [1,2,3].map(justReturn(2))
/// ~~~
public func justReturn<Input, Output>(
    _ result: @escaping @autoclosure () -> Output
) -> (Input) -> Output {
    return { _ in result() }
}
