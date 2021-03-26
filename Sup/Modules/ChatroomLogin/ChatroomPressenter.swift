//
//  ChatroomPressenter.swift
//  ChatroomLogin
//
//  Created by Andrey Novikov on 3/26/21.
//

import Foundation
import Utility
import RxSwift
import RxCocoa

protocol ChatroomPresentation {
    typealias Input = (username: Driver<String>,
                       email: Driver<String>,
                       loginTapped: Driver<Void>)
    typealias Output = (loginEnable: Driver<Bool>, ())
    typealias Producer = (Input) -> ChatroomPresentation
    
    var input: Input { get set }
    var output: Output { get set }
}


// MARK: - ChatroomPresenter

class ChatroomPresenter: ChatroomPresentation {
    typealias UseCases = (login: (_ username: String, _ email: String) -> Single<Void>,
                          ())
    
    // MARK: - Viper modules

    var input: Input
    var output: Output
        
    private let router: ChatroomRouting
    private let useCases: UseCases
    
    
    // MARK: - Private properties
    
    private let dispose = DisposeBag()
    
    // MARK: - Object livecycle
    
    init(input: ChatroomPresentation.Input, router: ChatroomRouting, useCases: UseCases) {
        self.input = input
        self.output = ChatroomPresenter.output(input: input)
        self.router = router
        self.useCases = useCases
        
        loginProcess()
    }
}

// MARK: - Output

private extension ChatroomPresenter {
    static func output(input: ChatroomPresentation.Input) -> ChatroomPresentation.Output {
        let loginEnable = Driver.combineLatest(input.username, input.email).map { (name, email)  in
            return !name.isEmpty && email.isValidEmail()
        }
        
        return (loginEnable: loginEnable, ())
    }
}

// MARK: - Process

private extension ChatroomPresenter {
    func loginProcess() {
        input
            .loginTapped
            .withLatestFrom(Driver.combineLatest(input.username, input.email))
            .asObservable()
            .flatMap { [useCases] (username, password) in
                useCases.login(username, password)
            }.asDriver(onErrorDriveWith: .never())
            .drive()
            .disposed(by: dispose)
    }
}
