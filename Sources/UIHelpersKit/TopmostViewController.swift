//
//  File.swift
//  
//
//  Created by Ernest Babayan on 22.05.2021.
//

import UIKit


public extension UIViewController {
    func topmostViewController() -> UIViewController {
        if let presented = self.presentedViewController {
            return presented.topmostViewController()
        }
        
        if let tabBar = self as? UITabBarController {
            return tabBar.selectedViewController?.topmostViewController() ?? self
        }
        
        if let nc = self as? UINavigationController {
            return nc.visibleViewController?.topmostViewController() ?? self
        }
        
        return self
    }
}

/// ⚠️ Unsafe way
public func TopmostViewController(
    in window: UIWindow = UIApplication.shared.keyWindow!
) -> UIViewController {
    window.rootViewController!.topmostViewController()
}
