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

class MoreVC: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var feedbackButton: UIButton!
    @IBOutlet weak var bugButton: UIButton!
    @IBOutlet weak var rateButton: UIButton!
    
    // MARK: Set email to send feedback
    
    let devEmail = "support@pokerApp1.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func feedbackTapped(_ sender: UIButton) {
        let subject = "Feedback to app developers"
        sendEmail(subject: subject)
    }
    
    @IBAction func bugTapped(_ sender: UIButton) {
        let subject = "Report a problem in app"
        sendEmail(subject: subject)
    }
    
    @IBAction func rateTapped(_ sender: UIButton) {
        rateApp()
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
    func mailComposeController(_ controller: MFMailComposeViewController,didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
// MARK: Native iOS pop-up to rate the app
    
    private func rateApp() {
        SKStoreReviewController.requestReview()
    }
    
}
