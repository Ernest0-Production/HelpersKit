//
//  File.swift
//  
//
//  Created by Ernest Babayan on 21.05.2021.
//

import RxSwift
import RxCocoa
import Foundation


public extension Disposable {
    ///  ~~~
    /// items.bind(to: collectionView)(cellFactory).dispose(whenDealloc: collectionView)
    ///  ~~~
    func dispose(whenDealloc object: NSObject) {
        _ = object.rx.deallocated.subscribe(onDisposed: dispose)
    }
}

public extension ReactiveCompatible where Self: NSObject {
    ///  ~~~
    /// label.binding({ $0.display(viewModel: viewModel) })
    ///  ~~~
    @discardableResult
    func binding(_ subscription: (Self) -> Disposable) -> Self {
        subscription(self).dispose(whenDealloc: self)
        return self
    }
    
    ///  ~~~
    /// label.binding(viewModel.title, to: \.rx.text)
    ///  ~~~
    @discardableResult
    func binding<Value>(
        _ value: Observable<Value>,
        to binderProvider: (Self) -> Binder<Value>
    ) -> Self {
        value.bind(to: binderProvider(self)).dispose(whenDealloc: self)
        return self
    }
}
