//
//  File.swift
//  
//
//  Created by Ernest on 30.06.2021.
//

import UIKit
import CoreHelpersKit


public extension UIImageView {
    func resizable() -> Self {
        let token = observe(\.image) { [weak self] object, change in
            if let image = change.newValue {
                self?.addAspectRatioConstraint(image: image)
            }
        }
        
        whenDeallocated(self, token.invalidate)
        
        return self
    }
    
    private func addAspectRatioConstraint(image: UIImage?) {
        let resizableConstraintIdentifier = "resizableConstraintIdentifier"
        
        for constraint in self.constraints where constraint.identifier == resizableConstraintIdentifier {
            removeConstraint(constraint)
        }
        
        guard let image = image else {
            return
        }
        
        let aspectRatio = image.size.width / image.size.height
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: .width,
            relatedBy: .equal,
            toItem: self,
            attribute: .height,
            multiplier: aspectRatio,
            constant: 0.0
        )
        
        constraint.identifier = resizableConstraintIdentifier
        
        addConstraint(constraint)
    }
}
