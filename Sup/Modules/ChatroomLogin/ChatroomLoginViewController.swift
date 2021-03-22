//
//  ChatroomLoginViewController.swift
//  ChatroomLogin
//
//  Created by Andrey Novikov on 3/22/21.
//

import UIKit

class ChatroomLoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    // MARK: - Object livecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

// MARK: - Setup UI

private extension ChatroomLoginViewController {
    func setupUI() {
        avatarImageView.image = UIImage(named: "male", in: Bundle(for: ChatroomLoginViewController.self), with: nil)
        loginButton.setImage(UIImage(named: "login", in: Bundle(for: ChatroomLoginViewController.self), with: nil), for: .normal)
    }
}
