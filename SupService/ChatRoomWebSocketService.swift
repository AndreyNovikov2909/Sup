//
//  ChatRoomWebSocketService.swift
//  SupService
//
//  Created by Andrey Novikov on 3/26/21.
//

import Foundation

protocol ChatRoomWebSocketAPI {
    func login(username: String, email: String)
}

public class ChatRoomWebSocketService {
    public init() {}
}

extension ChatRoomWebSocketService: ChatRoomWebSocketAPI {
    public func login(username: String, email: String) {
        print("Login request recive for username: \(username), email: \(email)")
    }
}
