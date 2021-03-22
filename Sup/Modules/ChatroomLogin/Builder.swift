//
//  Builder.swift
//  ChatroomLogin
//
//  Created by Andrey Novikov on 3/22/21.
//

import UIKit
import Utility

public final class Builder {
    public static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "ChatroomLogin", bundle: Bundle(for: self))
        let viewController: ChatroomLoginViewController = .instantiate(from: storyboard)
        
        return viewController
    }
}
