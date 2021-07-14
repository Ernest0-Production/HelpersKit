//
//  File.swift
//  
//
//  Created by Ernest on 30.06.2021.
//

import UIKit
import CoreHelpersKit


public extension UIImageView {
    @discardableResult
    func resizable() -> Self {
        let token = (self as UIImageView).observe(\.image, options: [.initial, .old, .new]) { [weak self] object, change in
            if let image = change.newValue {
                self?.addAspectRatioConstraint(image: image)
            }
        }
        
        whenDeallocated(self, token.invalidate)
        
        return self
    }
    
    static let resizableConstraintIdentifier = "resizableConstraintIdentifier"
    
    private func addAspectRatioConstraint(image: UIImage?) {
        guard let image = image else {
            return
        }
        
        let aspectRatio = image.size.width / image.size.height
        
        guard aspectRatio.isNormal else {
            removeAspectRatioConstraint()
            return
        }
        
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .width,
            relatedBy: .equal,
            toItem: self,
            attribute: .height,
            multiplier: aspectRatio,
            constant: 0.0
        )
        
        constraint.identifier = Self.resizableConstraintIdentifier
        constraint.isActive = true
    }
    
    private func removeAspectRatioConstraint() {
        for constraint in self.constraints where constraint.identifier == Self.resizableConstraintIdentifier {
            removeConstraint(constraint)
        }
    }
}
