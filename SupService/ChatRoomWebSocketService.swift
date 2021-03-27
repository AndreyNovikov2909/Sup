//
//  ChatRoomWebSocketService.swift
//  SupService
//
//  Created by Andrey Novikov on 3/26/21.
//

import Foundation
import SocketIO
import Starscream

protocol ChatRoomWebSocketAPI {
    func login(username: String, email: String)
}

public class ChatRoomWebSocketService {
    private var socketManager: SocketManager!
    private var socket: SocketIOClient!
    private let socketUrlString: String
    
    public init(socketUrlString: String) {
        self.socketUrlString = socketUrlString
        
        let url = URL(string: socketUrlString)!
        setup(usingSocketUrl: url)
    }
    
    deinit {
        socket.disconnect()
    }
}


// MARK: - ChatRoomWebSocketAPI

extension ChatRoomWebSocketService: ChatRoomWebSocketAPI {
    public func login(username: String, email: String) {
        print("Login request recive for username: \(username), email: \(email)")
        socket.emit("login", username, email)
    }
}



private extension ChatRoomWebSocketService {
    func setup(usingSocketUrl socketUrl: URL) {
        socketManager = SocketManager(socketURL: socketUrl)
        socket = socketManager.defaultSocket
        socket.connect()
    }
}
