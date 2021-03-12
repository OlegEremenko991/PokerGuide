//
//  MoreVC.swift
//  PokerApp1
//
//  Created by Олег Еременко on 06.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import UIKit
import StoreKit
import MessageUI

final class MoreVC: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var feedbackButton: UIButton!
    @IBOutlet private weak var bugButton: UIButton!
    @IBOutlet private weak var rateButton: UIButton!
    
    // MARK: - Private properties
    
    private let devEmail = "support@pokerguides.com"
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    // MARK: - Private methods
    
    private func setupButtons() {
        [feedbackButton, bugButton, rateButton].forEach {
            $0?.customRoundedStyle()
        }
    }
    
    private func sendEmail(subject: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([devEmail])
            mail.setMessageBody("<p>Your message: </p>", isHTML: true)
            mail.setSubject(subject)
            present(mail, animated: true)
        } else {
            print("error")
        }
    }
    
    private func rateApp() {
        SKStoreReviewController.requestReview()
    }
    
    // MARK: - IBActions

    @IBAction func feedbackTapped(_ sender: UIButton) {
        sendEmail(subject: "Feedback to app developers")
    }
    
    @IBAction func bugTapped(_ sender: UIButton) {
        sendEmail(subject: "Report a problem in app")
    }
    
    @IBAction func rateTapped(_ sender: UIButton) {
        rateApp()
    }
    
}

// MARK: - MFMailComposeViewControllerDelegate

extension MoreVC: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController,didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
