//
//  ChatroomRouter.swift
//  Sup
//
//  Created by Andrey Novikov on 3/26/21.
//

import UIKit

protocol ChatroomRouting {
    
}

// MARK: - ChatRoomRouter

class ChatroomRouter {
    
    private unowned var viewController: UIViewController
    
    init(viewcontroller: UIViewController) {
        self.viewController = viewcontroller
    }
}


extension ChatroomRouter: ChatroomRouting {
    
}
