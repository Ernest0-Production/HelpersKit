//
//  File.swift
//  
//
//  Created by Ernest Babayan on 22.05.2021.
//

///  ~~~
/// ["1","2","a"].map(when(\.isLetter, justReturn("undefined")))
///  ~~~
public func when<Object>(
    _ condition: @escaping (Object) -> Bool,
    return anotherObject: @escaping (Object) -> Object
) -> (Object) -> Object {
    return { object in
        if condition(object) { return  anotherObject(object) }
        return object
    }
}

///  ~~~
/// ["1","2","a"].do(when(\.isLetter, { print($0) })
///  ~~~
public func when<Object>(
    _ condition: @escaping (Object) -> Bool,
    do action: @escaping (Object) -> Void
) -> (Object) -> Void {
    return { object in
        if condition(object) { action(object) }
    }
}

///  ~~~
/// [1,2,3,nil,5].map(onNil(justReturn(2))
///  ~~~
public func onNil<Object>(
    _ fallback: @escaping () -> Object
) -> (Object?) -> Object {
    return { $0 ?? fallback() }
}


///  ~~~
/// isSelectedObservable.map(when(true: Images.like(), false: Images.dislike))
///  ~~~
public func when<Result>(
    true onTrue: @escaping () -> Result,
    false onFalse: @escaping () -> Result
) -> (Bool) -> Result {
    return {
        if $0 { return onTrue() }
        else { return onFalse() }
    }
}
