//
//  File.swift
//  
//
//  Created by Ernest Babayan on 23.06.2021.
//

import UIKit
import func AVFoundation.AVMakeRect


public extension UIImage {
    /// if iOS 13, use .withTintColor(_ color:)
    func tintColor(_ color: UIColor) -> UIImage {
        UIGraphicsImageRenderer(size: size).image { _ in
            color.set()
            withRenderingMode(.alwaysTemplate).draw(at: .zero)
        }
    }
    
    func scaleToFit(_ targetSize: CGSize) -> UIImage {
        resized(AVMakeRect(aspectRatio: size, insideRect: .init(origin: .zero, size: targetSize)).size)
    }
    
    func resized(_ newSize: CGSize) -> UIImage {
        UIGraphicsImageRenderer(size: newSize)
            .image { _ in draw(in: CGRect(origin: .zero, size: newSize)) }
            .withRenderingMode(renderingMode)
    }
}
