//
//  CustomTextField.swift
//  Navigation
//
//  Created by Arsham Oganesian on 30.05.2023.
//

import Foundation
import UIKit

final class CustomTextField: UITextField {
    var insets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
   
    
//    Для установки через инизиализатор
//    var insets: UIEdgeInsets
//
//    init(insets: UIEdgeInsets) {
//        self.insets = insets
//        super.init(frame: .zero)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
//    смещает текст относительно плейсхолдера
//    override func textRect(forBounds: CGRect) -> CGRect {
//        return bounds.inset(by: insets)
//    }
}

