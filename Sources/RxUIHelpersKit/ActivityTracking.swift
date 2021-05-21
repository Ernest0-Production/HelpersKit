//
//  File.swift
//  
//
//  Created by Ernest Babayan on 21.05.2021.
//

import RxSwift
import RxCocoa
import RxCoreHelpersKit


public extension PrimitiveSequence where Trait == SingleTrait {
    ///  ~~~
    /// dataLoader.load()
    ///     .map(toViewModels)
    ///     .trackActivity(loaderView.rx.isLoading)
    ///     .bind(to: stackView.rx.views)
    ///  ~~~
    func trackActivity(_ isProcessing: Binder<Bool>) -> Self {
        trackActivity(isProcessing.onNext)
    }
}

public extension PrimitiveSequence where Trait == CompletableTrait, Element == Never {
    ///  ~~~
    /// profileEditor.update(with: user)
    ///     .trackActivity(loaderView.rx.isLoading)
    ///     .subscribe(onSuccess: dismissScreenFlow)
    ///  ~~~
    func trackActivity(_ isProcessing: Binder<Bool>) -> Self {
        trackActivity(isProcessing.onNext)
    }
}
