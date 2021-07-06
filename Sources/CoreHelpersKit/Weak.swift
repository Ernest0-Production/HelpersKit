//
//  File.swift
//  
//
//  Created by Ernest on 02.07.2021.
//


public final class Weak<T: AnyObject> {
    public init(_ value: T? = nil) {
        self.value = value
    }
    
    public weak var value: T?
}


public final class Unowned<T: AnyObject> {
    public init(_ value: T? = nil) {
        self.value = value
    }
    
    public weak var value: T!
}
