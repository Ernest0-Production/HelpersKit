//
//  File.swift
//  
//
//  Created by Ernest Babayan on 20.05.2021.
//

import RxSwift
import RxRelay
import Foundation


public extension BehaviorRelay {
    @discardableResult
    func update(_ transform: (inout Element) -> Void) -> Self {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        
        var value = self.value
        transform(&value)
        accept(value)
        
        return self
    }
}

public extension BehaviorSubject {
    @discardableResult
    func update(_ transform: (inout Element) -> Void) throws -> Self {
        objc_sync_enter(self); defer { objc_sync_exit(self) }
        
        var value = try value()
        transform(&value)
        onNext(value)
        
        return self
    }
}
