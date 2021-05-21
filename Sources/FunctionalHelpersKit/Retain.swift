//
//  File.swift
//  
//
//  Created by Ernest Babayan on 19.06.2021.
//

public func retain(_ object: Any) -> VoidClosure {
    return { _ = object }
}

public func retain<Input>(_ object: Any) -> (Input) -> Void {
    return { _ in _ = object }
}
