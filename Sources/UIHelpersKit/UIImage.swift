//
//  File.swift
//  
//
//  Created by Ernest Babayan on 23.06.2021.
//

import UIKit


public extension UIImage {
    /// if iOS 13, use .withTintColor(_ color:)
    func tintColor(_ color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        
        color.set()
        
        self
            .withRenderingMode(RenderingMode.alwaysTemplate)
            .draw(in: CGRect(origin: .zero, size: size))
        
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
}
