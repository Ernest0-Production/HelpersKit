//
//  File.swift
//  
//
//  Created by Ernest Babayan on 21.05.2021.
//

import RxSwift


public extension PrimitiveSequence where Trait == SingleTrait {
    func trackActivity(_ isProcessing: @escaping (Bool) -> Void) -> Self {
        self.do(
            onSubscribe: { isProcessing(true) },
            onDispose: { isProcessing(false) }
        )
    }
}

public extension PrimitiveSequence where Trait == CompletableTrait, Element == Never {
    func trackActivity(_ isProcessing: @escaping (Bool) -> Void) -> Self {
        self.do(
            onSubscribe: { isProcessing(true) },
            onDispose: { isProcessing(false) }
        )
    }
}
