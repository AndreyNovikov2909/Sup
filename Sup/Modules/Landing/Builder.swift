//
//  Builder.swift
//  Landing
//
//  Created by Andrey Novikov on 3/22/21.
//

import UIKit
import Utility

public final class Builder {
    public static func build(compliton:@escaping () -> Void) -> UIViewController {
        let storyboard = UIStoryboard(name: "Landing", bundle: Bundle(for: self))
        let viewController: LandingViewController = .instantiate(from: storyboard)
        viewController.onStart = compliton
        return viewController
    }
}
