//
//  File.swift
//  
//
//  Created by Ernest Babayan on 22.05.2021.
//

import UIKit
import RxSwift
import RxCocoa


public extension Reactive where Base: UINavigationController {
    func setNavigationBarHidden(
        _ hidden: Bool,
        animated: Bool,
        for controller: UIViewController
    ) -> Disposable {
        observe(\.parent).flatMapLatest({ [weak controller, weak base] (parentController: UIViewController?) -> Observable<Void> in
            guard
                parentController === base,
                let controller = controller
            else {
                return Observable.never()
            }
            
            if controller.isViewLoaded {
                return Observable.just(())
            }
            
            return controller.rx
                .methodInvoked(#selector(UIViewController.viewWillAppear))
                .map({ _ in })
        })
        .subscribe(onNext: { [weak base] in
            base?.setNavigationBarHidden(hidden, animated: animated)
        })
    }
}
