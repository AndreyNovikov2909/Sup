//
//  UseCasesFactory.swift
//  UseCases
//
//  Created by Andrey Novikov on 3/26/21.
//

import Foundation
import SupService

public final class UseCasesFactory {
    private static let webSocketService = ChatRoomWebSocketService()
    public static let accountInteractor = AccountInteractor(webScketService: webSocketService)
    
}
