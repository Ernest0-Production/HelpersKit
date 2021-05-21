//
//  File.swift
//  
//
//  Created by Ernest Babayan on 14.05.2021.
//

public func element<S: Sequence, Output>(
    _ transform: @escaping (S.Element) -> Output
) -> (S) -> [Output] {
    return { $0.map(transform) }
}

public func compactElement<S: Sequence, Output>(
    _ transform: @escaping (S.Element) -> Output?
) -> (S) -> [Output] {
    return { $0.compactMap(transform) }
}

public func flatMapElement<S: Sequence, Output: Sequence>(
    _ transform: @escaping (S.Element) -> Output
) -> (S) -> [Output.Element] {
    return { $0.flatMap(transform) }
}

public func forEach<S: Sequence>(
    _ transform: @escaping (S.Element) -> Void
) -> (S) -> Void {
    return { $0.forEach(transform) }
}

public func enumerated<S: Sequence, Output>(
    _ transform: @escaping (Int, S.Element) -> Output
) -> (S) -> [Output] {
    return { $0.enumerated().map(transform) }
}

public func filter<S: Sequence>(
    _ condition: @escaping (S.Element) -> Bool
) -> (S) -> [S.Element] {
    return { $0.filter(condition) }
}

public func first<S: Sequence>(
    where predicate: @escaping (S.Element) -> Bool
) -> (S) -> S.Element? {
    return { $0.first(where: predicate) }
}

public func prefix<S: Sequence>(
    while predicate: @escaping (S.Element) -> Bool
) -> (S) -> [S.Element] {
    return { $0.prefix(while: predicate) }
}

public func prefix<S: Sequence>(
    _ maxLength: Int
) -> (S) -> PrefixSequence<S> {
    return { $0.prefix(maxLength) }
}

public func sorted<S: Sequence>(
    by areInIncreasingOrder: @escaping (S.Element, S.Element) -> Bool
) -> (S) -> [S.Element] {
    return { $0.sorted(by: areInIncreasingOrder) }
}

///  ~~~
/// [[1,2,3], [3,4,5]].flatMap(flatten) // [1,2,3,3,4,5]
///  ~~~
public func flatten<T>(_ t: T) -> T { t }
