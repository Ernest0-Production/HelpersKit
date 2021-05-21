//
//  File.swift
//  
//
//  Created by Ernest Babayan on 22.05.2021.
//

/// ~~~
/// let updatedModel = transforming(model) { $0.property = "qwerty" }
/// ~~~
public func transforming<T>(_ object: T, _ transform: (inout T) -> Void) -> T {
    var copy = object
    transform(&copy)
    return copy
}

///  ~~~
/// relay.update(setter(to: \.userName, "New Name"))
/// let updatedUser = transforming(user, setter(to: \.uame, "New Name"))
///  ~~~
public func setter<Object, Value>(
    to keyPath: WritableKeyPath<Object, Value>,
    _ value: @escaping @autoclosure () -> Value
) -> (inout Object) -> Void {
    return { $0[keyPath: keyPath] = value() }
}

///  ~~~
/// relay.update(setter(to: \.name, "New Name"))
/// let updatedUser = transforming(user, setter(to: \.uame, "New Name"))
///  ~~~
public func setter<Object, Value>(
    to keyPath: ReferenceWritableKeyPath<Object, Value>,
    _ value: @escaping @autoclosure () -> Value
) -> (Object) -> Void {
    return { $0[keyPath: keyPath] = value() }
}
