//
//  AccountInteractor.swift
//  UseCases
//
//  Created by Andrey Novikov on 3/26/21.
//

import Foundation
import SupService
import RxSwift

protocol AccountInteractorPresentation {
    func login(username: String, email: String) -> Single<Void>
}

public final class AccountInteractor {
    private let webScketService: ChatRoomWebSocketService
    
    init(webScketService: ChatRoomWebSocketService) {
        self.webScketService = webScketService
    }
}

extension AccountInteractor: AccountInteractorPresentation {
    public func login(username: String, email: String) -> Single<Void> {
        webScketService.login(username: username, email: email)
        return .never()
    }
}
