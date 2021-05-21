//
//  File.swift
//  
//
//  Created by Ernest Babayan on 01.06.2021.
//

import RxSwift


public extension PrimitiveSequence where Trait == SingleTrait {
    func `do`(completable: @escaping (Element) -> Completable) -> Self {
        self.flatMap({ (element: Element) in
            completable(element).andThen(Single.just(element))
        })
    }
}

public extension ObservableType {
    func `do`(completable: @escaping (Element) -> Completable) -> Observable<Element> {
        self.flatMap({ (element: Element) in
            completable(element).andThen(Observable.just(element))
        })
    }
}
