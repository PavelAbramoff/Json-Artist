//
//  UIView + Extancion.swift
//  Json-Artist
//
//  Created by apple on 9/23/24.
//

import UIKit

extension UIView {
    
    func addShadowOnView() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 1
    }
}
