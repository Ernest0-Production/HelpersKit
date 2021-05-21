//
//  File.swift
//  
//
//  Created by Ernest Babayan on 22.05.2021.
//

/// ~~~
/// let updateCommand = execute(updateUserName, with: "New Name")
/// ~~~
public func execute<Input, Output>(
    _ function: @escaping (Input) -> Output,
    with input: @escaping @autoclosure () -> Input
) -> () -> Output {
    return { function(input()) }
}

///  ~~~
/// ["1","12","123"].contains(where: execute(with: \.count, equal(to: 2)))
///  ~~~
public func execute<Object, Value, Output>(
    with value: @escaping (Object) -> Value,
    _ function: @escaping (Value) -> Output
) -> (Object) -> Output {
    return { function(value($0)) }
}

// MARK: - Instance

///  ~~~
/// ["Hello", "world"].map(execute(String.lowercased))
///  ~~~
public func execute<Object, Result>(
    _ instanceFunctionGetter: @escaping (Object) -> () -> Result
) -> (Object) -> Result {
    return { instanceFunctionGetter($0)() }
}

///  ~~~
/// ["12","23","13"].map(execute(String.hasPrefix, with: "1"))
///  ~~~
public func execute<Object, Value, Result>(
    _ instanceFunctionGetter: @escaping (Object) -> (Value) -> Result,
    with value: @escaping @autoclosure () -> Value
) -> (Object) -> Result {
    return { instanceFunctionGetter($0)(value()) }
}

// MARK: - Weakly

///  ~~~
/// api.getUser().map(execute(weakly: storage, Storage.save))
///  ~~~
public func execute<Object: AnyObject, Input, Output>(
    weakly target: Object,
    _ instanseFunctionGetter: @escaping (Object) -> (Input) -> Output
) -> (Input) -> Output? {
    return { [weak target] input in
        target.map(instanseFunctionGetter)?(input)
    }
}

///  ~~~
/// api.getUser().map(execute(weakly: storage, Storage.save))
///  ~~~
public func execute<Object: AnyObject, Input, Output>(
    weakly target: Object,
    _ instanseFunctionGetter: @escaping (Object) -> (Input) -> Output?
) -> (Input) -> Output? {
    return { [weak target] input in
        target.map(instanseFunctionGetter)?(input)
    }
}

///  ~~~
/// api.getUser().map(execute(weakly: storage, Storage.save))
///  ~~~
public func execute<Object: AnyObject, Input, Output>(
    weakly target: Object,
    _ instanseFunctionGetter: @escaping (Object) -> (Input) -> Output,
    onNil fallback: @escaping (Input) -> Output
) -> (Input) -> Output {
    return { [weak target] input in
        target.map(instanseFunctionGetter)?(input) ?? fallback(input)
    }
}

///  ~~~
/// api.getUser().map(execute(weakly: storage, Storage.save))
///  ~~~
public func execute<Object: AnyObject, Output>(
    weakly target: Object,
    _ instanseFunctionGetter: @escaping (Object) -> () -> Output
) -> () -> Output? {
    return { [weak target] in
        target.map(instanseFunctionGetter)?()
    }
}

///  ~~~
/// api.getUser().map(execute(weakly: storage, Storage.save))
///  ~~~
public func execute<Object: AnyObject, Output>(
    weakly target: Object,
    _ instanseFunctionGetter: @escaping (Object) -> () -> Output?
) -> () -> Output? {
    return { [weak target] in
        target.map(instanseFunctionGetter)?()
    }
}

///  ~~~
/// api.getUser().map(execute(weakly: storage, Storage.save))
///  ~~~
public func execute<Object: AnyObject, Output>(
    weakly target: Object,
    _ instanseFunctionGetter: @escaping (Object) -> () -> Output,
    onNil fallback: @escaping () -> Output
) -> () -> Output {
    return { [weak target] in
        target.map(instanseFunctionGetter)?() ?? fallback()
    }
}

// MARK: - Unowned

///  ~~~
/// api.getUser().map(execute(weakly: storage, Storage.save))
///  ~~~
public func execute<Object: AnyObject, Input, Output>(
    unowned target: Object,
    _ instanseFunctionGetter: @escaping (Object) -> (Input) -> Output
) -> (Input) -> Output {
    return { [unowned target] input in
        instanseFunctionGetter(target)(input)
    }
}

///  ~~~
/// api.getUser().map(execute(weakly: storage, Storage.save))
///  ~~~
public func execute<Object: AnyObject, Output>(
    unowned target: Object,
    _ instanseFunctionGetter: @escaping (Object) -> () -> Output
) -> () -> Output {
    return { [unowned target] in
        instanseFunctionGetter(target)()
    }
}
