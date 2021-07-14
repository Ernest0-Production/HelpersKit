//
//  File.swift
//  
//
//  Created by Ernest on 14.07.2021.
//

///  ~~~
/// object.doSomething(with argument: conditional {
///     if a > b { return 12 } else { return 8 * 3 }
/// })
///  ~~~
public func conditional<Result>(_ builder: () -> Result) -> Result {
    builder()
}
