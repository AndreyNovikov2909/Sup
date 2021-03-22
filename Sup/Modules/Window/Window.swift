//
//  Window.swift
//  Window
//
//  Created by Andrey Novikov on 3/22/21.
//

import UIKit


class Window: UIWindow {
    
    // MARK: - Instance properties
    
    var presenter: Presentation?
    
    // MARK: - Object live cycle
    
    override init(windowScene: UIWindowScene) {
        super.init(windowScene: windowScene)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}
