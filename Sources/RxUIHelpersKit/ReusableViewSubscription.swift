//
//  File.swift
//  
//
//  Created by Ernest Babayan on 21.05.2021.
//

import UIKit
import RxSwift
import RxCocoa


public extension UITableViewCell {
    /// Управляет сбросом подписки при реюзе
    ///  ~~~
    /// cell.setSubscription(cell.someView.bind(to: viewModel))
    ///  ~~~
    @discardableResult
    func setSubscription(_ disposable: Disposable) -> Self {
        restartingDisposable = CompositeDisposable(
            disposable,
            rx.methodInvoked(#selector(UITableViewCell.prepareForReuse)).subscribe({ _ in disposable.dispose() })
        )
        
        return self
    }
}
    
public extension UICollectionViewCell {
    /// Управляет сбросом подписки при реюзе
    ///  ~~~
    /// cell.setSubscription(cell.someView.bind(to: viewModel))
    ///  ~~~
    @discardableResult
    func setSubscription(_ disposable: Disposable) -> Self {
        restartingDisposable = CompositeDisposable(
            disposable,
            rx.methodInvoked(#selector(UICollectionViewCell.prepareForReuse)).subscribe({ _ in disposable.dispose() })
        )
        
        return self
    }
}

private extension NSObject {
    var restartingDisposable: Disposable? {
        get { objc_getAssociatedObject(self, &restartingDisposableContext) as? Disposable }
        set {
            restartingDisposable?.dispose()
            objc_setAssociatedObject(self, &restartingDisposableContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

private var restartingDisposableContext: UInt8 = 0
