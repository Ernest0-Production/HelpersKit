//
//  File.swift
//  
//
//  Created by Ernest Babayan on 21.05.2021.
//

import RxSwift
import RxRelay
import Foundation

/// Observable с возможностью получения синхронно значение.
/// Иными словами, read-only BehaviorRelay 
public final class ObservableState<Element> {
    public init(
        sync valueGetter: @escaping () -> Element,
        async observable: Observable<Element>
    ) {
        self._valueGetter = { [lock] in
            lock!.lock(); defer { lock!.unlock() }
            return valueGetter()
        }
        
        self.observable = observable.catch({ [_valueGetter] _ in
            Observable.just(_valueGetter!())
        })
    }
    
    public convenience init(_ relay: BehaviorRelay<Element>) {
        self.init(
            sync: { relay.value },
            async: relay.asObservable()
        )
    }
    
    private var lock: NSLock! = NSLock()
    
    private(set) var _valueGetter: (() -> Element)!
    
    public var value: Element { _valueGetter() }
    
    private(set) public var observable: Observable<Element>!
}
