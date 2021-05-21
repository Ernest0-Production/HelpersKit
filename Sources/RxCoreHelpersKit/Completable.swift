//
//  File.swift
//  
//
//  Created by Ernest Babayan on 02.06.2021.
//

import RxSwift


public extension PrimitiveSequence where Trait == CompletableTrait, Element == Never {
    static func just(_ execute: @escaping () throws -> Void) -> Self {
        Completable.create(subscribe: { observer in
            do { try execute(); observer(.completed) }
            catch { observer(.error(error)) }
            return Disposables.create()
        })
    }
}
