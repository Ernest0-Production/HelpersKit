//
//  File.swift
//  
//
//  Created by Ernest Babayan on 20.05.2021.
//

import Foundation
import RxSwift


/// Принимает поток подписок и при получении новой диспозит старую.
public final class LatestDisposable: Disposable {
    private let lock = NSRecursiveLock()
    
    private var sourceDisposable: Disposable!
    private var lastDisposable: Disposable? {
        willSet { lastDisposable?.dispose() }
    }
    
    public init(_ source: Observable<Disposable>) {
        sourceDisposable = source.subscribe({ event in
            self.lock.lock(); defer { self.lock.unlock() }
            self.lastDisposable = event.element
        })
    }
    
    public func dispose() {
        sourceDisposable.dispose()
        lastDisposable?.dispose()
    }
}

public extension ObservableConvertibleType where Element == Disposable {
    func switchLatest() -> Disposable {
        LatestDisposable(asObservable())
    }
}
