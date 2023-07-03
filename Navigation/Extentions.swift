//
//  Extentions.swift
//  Navigation
//
//  Created by Arsham Oganesian on 01.06.2023.
//

import Foundation
import UIKit


extension UIView {
    
    // indetifier
    static var indetifier: String {
        String(describing: self )
    }
    
    //add subviews and set translatesAutoresizingMaskIntoConstraints
    func addSubviews(allAutoLayout: Bool,  subviews: UIView...) {
        if allAutoLayout == false {
            subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        }
        subviews.forEach { addSubview($0) }
    }
}

// shake view
extension UIView {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.repeatCount = 3
        animation.duration = 0.07
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        layer.add(animation, forKey: "position")
    }
}



//add init for hex-color
extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        let length = hexSanitized.count
        var rgb: UInt64 = 0
        
        var r: CGFloat =  0.0
        var g: CGFloat =  0.0
        var b: CGFloat =  0.0
        var a: CGFloat =  1.0
        
        guard Scanner(string: hexSanitized).scanHexInt64( &rgb ) else { return nil }
        
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255
            b = CGFloat(rgb & 0x0000FF) / 255
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255
            a = CGFloat(rgb & 0x000000FF) / 255
        } else {
            return nil
        }
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.connectedScenes
          .filter({$0.activationState == .foregroundActive})
          .compactMap({$0 as? UIWindowScene})
          .first?.windows
          .filter({$0.isKeyWindow})
          .first?.rootViewController) -> UIViewController? {

        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}


