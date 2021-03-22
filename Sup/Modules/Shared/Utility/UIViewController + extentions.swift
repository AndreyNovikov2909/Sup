//
//  UIViewController + extentions.swift
//  Utility
//
//  Created by Andrey Novikov on 3/22/21.
//

import UIKit

public extension UIViewController {
    class func loadFromStroryboard<T: UIViewController>(stbName: String) -> T {
        let storyboard = UIStoryboard(name: stbName, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(identifier: String(describing: T.self)) as? T  else {
            fatalError("Storyboard, storyboard identifire and view controller should have same name, name: \(String(describing: T.self))")
        }
        return viewController
    }
    
    class func instantiate<T: UIViewController>(from storyboard: UIStoryboard, identifire: String) -> T {
        guard let viewController = storyboard.instantiateViewController(identifier: identifire) as? T else {
            fatalError("Indentifier: \(identifire) doosen't containts in storyboard \(#function)")
        }
        
        return viewController
    }
    
    class func instantiate(from storyboard: UIStoryboard) -> Self {
        return instantiate(from: storyboard, identifire: String(describing: self))
    }
    
    class func instantiate() -> Self {
        let className = String(describing: self)
        return instantiate(from: UIStoryboard(name: className, bundle: Bundle(for: self)), identifire: className)
    }
}

