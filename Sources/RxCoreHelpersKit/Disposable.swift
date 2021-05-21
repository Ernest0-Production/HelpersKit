//
//  File.swift
//  
//
//  Created by Ernest Babayan on 21.05.2021.
//

import RxSwift


public extension Disposable {
    /// ⚠️ Рекомендуется использовать ТОЛЬКО на подписке на Single, Completable.
    /// У Observable нет поведения автозавершения из-за неограниченности количества событий, поэтому подписка может жить всю жизнь приложения
    func ignoringDispose() {}
}

extension Array: Disposable where Element == Disposable? {
    public func dispose() {
        for element in self { element?.dispose() }
    }
}

/// ~~~
/// let action = DisposableAction { service.login(email, password) }
/// ~~~
public func DisposableAction(
    _ disposableProvider: @escaping () -> Disposable
) -> () -> Void {
    var disposeBag = DisposeBag()
    
    return {
        disposeBag = DisposeBag()
        disposeBag.insert(disposableProvider())
    }
}

/// ~~~
/// let action = DisposableAction { email, password in service.login(email, password) }
/// ~~~
public func DisposableAction<Input>(
    _ disposableProvider: @escaping (Input) -> Disposable
) -> (Input) -> Void {
    var disposeBag = DisposeBag()
    
    return { input in
        disposeBag = DisposeBag()
        disposeBag.insert(disposableProvider(input))
    }
}

public extension Disposables {
    static func retain(_ objects: AnyObject...) -> Disposable {
        Disposables.create(with: { _ = objects })
    }
}

public extension DisposeBag {
    func asDisposable() -> Disposable {
        Disposables.retain(self)
    }
}
