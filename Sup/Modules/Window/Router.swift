//
//  Router.swift
//  Window
//
//  Created by Andrey Novikov on 3/22/21.
//

import UIKit

protocol Routing: class {
    func routeToLanding()
}


class Router {
    typealias Submodules = (landingModule: (_ onStart: @escaping () -> Void) -> UIViewController,
                            chatRoomModule: () -> UIViewController)
    
    private let window: UIWindow
    private let submodules: Submodules
    
    init(window: UIWindow, submodules: Submodules) {
        self.window = window
        self.submodules = submodules
    }
}


// MARK: - Routing

extension Router: Routing {
    func routeToLanding() {
        let landingView = submodules.landingModule { [weak self] in
            self?.routeToChatroom()
        }
        window.rootViewController = landingView
        window.makeKeyAndVisible()
    }
    
    func routeToChatroom() {
        window.rootViewController = submodules.chatRoomModule()
        window.makeKeyAndVisible()
    }
}
