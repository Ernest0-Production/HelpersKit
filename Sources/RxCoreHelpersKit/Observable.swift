//
//  File.swift
//  
//
//  Created by Ernest Babayan on 21.05.2021.
//

import RxSwift


public extension ObservableConvertibleType {
    func skipNil<Wrapped>() -> Observable<Wrapped> where Element == Wrapped? {
        self.asObservable().filter({ $0 != nil }).map({ $0! })
    }
    
    func asOptional() -> Observable<Element?> {
        self.asObservable().map({ $0 })
    }
}
