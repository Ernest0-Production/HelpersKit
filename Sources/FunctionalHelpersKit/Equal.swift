//
//  File.swift
//  
//
//  Created by Ernest Babayan on 22.05.2021.
//

///  ~~~
/// ["world", "world"].allSatisfty(where: equal(to: "world"))
///  ~~~
public func equal<Element: Equatable>(
    to element: @escaping @autoclosure () -> Element
) -> (Element) -> Bool {
    return { $0 == element() }
}

///  ~~~
/// ["world", "world"].sorted(by: comparator(by: \.count, >)
///  ~~~
public func comparator<Element, Value: Equatable>(
    by comparableValue: @escaping (Element) -> Value,
    _ areInIncreasingOrder: (Value, Value) -> Bool
) -> (Element, Element) -> Bool {
    return { comparableValue($0) == comparableValue($1) }
}
