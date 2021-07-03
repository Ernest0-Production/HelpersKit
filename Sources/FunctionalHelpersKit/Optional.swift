//
//  File.swift
//  
//
//  Created by Ernest Babayan on 03.07.2021.
//

///  ~~~
/// [1,2,3,nil,5].map(onNil(justReturn(2))
///  ~~~
public func onNil<Object>(
    _ fallback: @escaping () -> Object
) -> (Object?) -> Object {
    return { $0 ?? fallback() }
}

///  ~~~
/// ["1","2",nil].map(optional(\.isEmpty)
///  ~~~
public func optional<Object, Result>(
    _ transform: @escaping (Object) -> Result
) -> (Object?) -> Result? {
    return { $0.map(transform) }
}

///  ~~~
/// ["1","2",nil].map(optional(\.isEmpty)
///  ~~~
public func optional<Object, Result>(
    _ transform: @escaping (Object) -> Result?
) -> (Object?) -> Result? {
    return { $0.flatMap(transform) }
}
