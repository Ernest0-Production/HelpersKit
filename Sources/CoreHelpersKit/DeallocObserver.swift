//
//  File.swift
//  
//
//  Created by Ernest Babayan on 27.06.2021.
//

import Foundation


private final class DeallocObserver {
    private let completion: () -> Void
    
    @discardableResult
    fileprivate init(
        _ object: AnyObject,
        _ completion: @escaping () -> Void
    ) {
        self.completion = completion
        objc_setAssociatedObject(object, "DeallocObserver", self, .OBJC_ASSOCIATION_RETAIN)
    }
    
    deinit { completion() }
}

public func whenDeallocated(_ object: AnyObject, _ completion: @escaping () -> Void) {
    DeallocObserver(object, completion)
}
