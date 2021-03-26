//
//  Builder.swift
//  ChatroomLogin
//
//  Created by Andrey Novikov on 3/22/21.
//

import UIKit
import Utility
import UseCases

public final class Builder {
    public static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "ChatroomLogin", bundle: Bundle(for: self))
        let viewController: ChatroomLoginViewController = .instantiate(from: storyboard)
        let accountInteractor = UseCasesFactory.accountInteractor
        let router = ChatroomRouter(viewcontroller: viewController)
        
        viewController.presenterProducer = { input in
            let useCases = (login: accountInteractor.login, ())
            let presenter = ChatroomPresenter(input: input,
                                              router: router,
                                              useCases: useCases)
            
            return presenter
        }
        
        return viewController
    }
}
