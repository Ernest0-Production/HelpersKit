//
//  File.swift
//  
//
//  Created by Ernest Babayan on 20.06.2021.
//

import UIKit


public extension UIViewController {
    @discardableResult
    func onWillAppear(_ handler: @escaping () -> Void) -> Self {
        addObserver(onWillAppear: handler)
    }
    
    @discardableResult
    func onDidAppear(_ handler: @escaping () -> Void) -> Self {
        addObserver(onDidAppear: handler)
    }

    @discardableResult
    func onWillDisappear(_ handler: @escaping () -> Void) -> Self {
        addObserver(onWillDisappear: handler)
    }
    
    @discardableResult
    func onDidDisappear(_ handler: @escaping () -> Void) -> Self {
        addObserver(onDidDisappear: handler)
    }

    private func addObserver(
        onWillAppear: @escaping () -> Void = {},
        onDidAppear: @escaping () -> Void = {},
        onWillDisappear: @escaping () -> Void = {},
        onDidDisappear: @escaping () -> Void = {}
    ) -> Self {
        let observer = ViewControllerLifeCycleObserver(
            onWillAppear: onWillAppear,
            onDidAppear: onDidAppear,
            onWillDisappear: onWillDisappear,
            onDidDisappear: onDidDisappear
        )
        
        addChild(observer)
        view.addSubview(observer.view)
        
        return self
    }
}

private final class ViewControllerLifeCycleObserver: UIViewController {
    init(
        onWillAppear: @escaping () -> Void = {},
        onDidAppear: @escaping () -> Void = {},
        onWillDisappear: @escaping () -> Void = {},
        onDidDisappear: @escaping () -> Void = {}
    ) {
        self.onWillAppear = onWillAppear
        self.onDidAppear = onDidAppear
        self.onWillDisappear = onWillDisappear
        self.onDidDisappear = onDidDisappear
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let onWillAppear: () -> Void
    private let onDidAppear: () -> Void
    private let onWillDisappear: () -> Void
    private let onDidDisappear: () -> Void
    
    override func viewWillAppear(_ animated: Bool) { onWillAppear() }
    
    override func viewDidAppear(_ animated: Bool) { onDidAppear() }
    
    override func viewWillDisappear(_ animated: Bool) { onWillDisappear() }
    
    override func viewDidDisappear(_ animated: Bool) { onDidDisappear() }
}
