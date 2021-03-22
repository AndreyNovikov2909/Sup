//
//  Builder.swift
//  Window
//
//  Created by Andrey Novikov on 3/22/21.
//

import UIKit
import Landing
import ChatroomLogin

public final class Builder {
    public static func build(scene: UIWindowScene) -> UIWindow {
        let window = Window(windowScene: scene)
        let modules: Router.Submodules = (landingModule: Landing.Builder.build,
                                          chatRoomModule: ChatroomLogin.Builder.build)
        
        let router = Router(window: window, submodules: modules)
        let presenter = Presenter(router: router)
        window.presenter = presenter
        
        return window
    }
}
