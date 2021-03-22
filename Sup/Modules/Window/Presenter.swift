//
//  Presenter.swift
//  Window
//
//  Created by Andrey Novikov on 3/22/21.
//

import Foundation

protocol Presentation {
    
}

class Presenter {
    private let router: Routing
    
    init(router: Routing) {
        self.router = router
        process()
    }
}

// MARK: - Presentation

extension Presenter: Presentation {
    
}


// MARK: - Pricess

private extension Presenter {
    func process() {
        router.routeToLanding()
    }
}
