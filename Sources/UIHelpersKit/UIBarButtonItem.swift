//
//  File.swift
//  
//
//  Created by Ernest Babayan on 14.05.2021.
//

import UIKit


public extension UIView {
    func asBarButtonItem() -> UIBarButtonItem { UIBarButtonItem(customView: self) }
}
