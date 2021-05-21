//
//  File.swift
//  
//
//  Created by Ernest Babayan on 02.06.2021.
//

public func recursive<Arguments, Result>(
    _ implementataionFunction: @escaping (Arguments, _ selfFunction: @escaping (Arguments) -> Result) -> Result
) -> (Arguments) -> Result {
    var recursiveFunction: ((Arguments) -> Result)!
    
    recursiveFunction = { (input: Arguments) -> Result in
        implementataionFunction(input, recursiveFunction)
    }
    
    return recursiveFunction
}

public func recursive<Arguments, Result>(
    with arguments: Arguments,
    _ implementataionFunction: @escaping (Arguments, _ selfFunction: @escaping (Arguments) -> Result) -> Result
) ->  Result {
    recursive(implementataionFunction)(arguments)
}

public func recursive<Result>(
    _ function: @escaping (_ selfFunction: @escaping () -> Result) -> Result
) ->  Result {
    recursive({ (_: Void, rectursiveFuntion) in rectursiveFuntion(void) })(void)
}

private var void: Void { () }
