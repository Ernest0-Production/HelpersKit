//
//  File.swift
//  
//
//  Created by Ernest Babayan on 21.05.2021.
//

import UIKit


public extension UIStackView {
    func clear() {
        for view in subviews { view.removeFromSuperview() }
    }
    
    func set(views: [UIView]) {
        clear()
        for view in views { addArrangedSubview(view) }
    }
}
