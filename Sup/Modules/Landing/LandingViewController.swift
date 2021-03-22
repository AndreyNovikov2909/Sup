//
//  LandingViewController.swift
//  Landing
//
//  Created by Andrey Novikov on 3/22/21.
//

import UIKit

class LandingViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    var onStart: (() -> Void)?
    
    // MARK: - Object livecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - IBActions
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        onStart?()
    }
}


// MARK: - SetupUI

private extension LandingViewController {
    func setupUI() {
        logoImageView.image = UIImage(named: "logo", in: Bundle(for: LandingViewController.self), with: nil)
        startButton.setImage(UIImage(named: "stratButton", in: Bundle(for: LandingViewController.self), compatibleWith: nil), for: .normal)
    }
}
