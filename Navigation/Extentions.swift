//
//  Extentions.swift
//  Navigation
//
//  Created by Arsham Oganesian on 01.06.2023.
//

import Foundation
import UIKit

extension UIView {
    
    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false}
        subviews.forEach { addSubview($0) }
    }
}
