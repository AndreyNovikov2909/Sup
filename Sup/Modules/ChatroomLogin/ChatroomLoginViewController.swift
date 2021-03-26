//
//  ChatroomLoginViewController.swift
//  ChatroomLogin
//
//  Created by Andrey Novikov on 3/22/21.
//

import UIKit
import RxSwift
import RxCocoa

class ChatroomLoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Viper Module
    
    var presenterProducer: ChatroomPresentation.Producer!
    private var presenter: ChatroomPresentation!
    
    // MARK: - Private properties
    
    private let dispose = DisposeBag()
    
    // MARK: - Object livecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        setupProducer()
        setupBinding()
    }
    
    private func setupProducer() {
        let input = (username: usernameTextField.rx.text.orEmpty.asDriver(),
                     email: emailTextField.rx.text.orEmpty.asDriver(),
                     loginTapped: loginButton.rx.tap.asDriver())
        
        presenter = presenterProducer(input)
    }
    
    private func setupBinding() {
        presenter.output.loginEnable.drive(loginButton.rx.isEnabled).disposed(by: dispose)
    }
}

// MARK: - Setup UI

private extension ChatroomLoginViewController {
    func setupUI() {
        avatarImageView.image = UIImage(named: "male", in: Bundle(for: ChatroomLoginViewController.self), with: nil)
        loginButton.setImage(UIImage(named: "login", in: Bundle(for: ChatroomLoginViewController.self), with: nil), for: .normal)
    }
}
