//
//  ContactDeveloperViewController.swift
//  Assaalny
//
//  Created by Mohammed Alessi on 24/03/2021.
//

import UIKit
import MessageUI

class ContactDeveloperViewController: UIViewController {
    
    @IBAction func twitterButtonTouched(_ sender: AButton) {
        guard let url = URL(string: "https://twitter.com/modalessi") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func emailButtonTouched(_ sender: AButton) {
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.setToRecipients(["aldemainy@gmail.com"])
            mail.setMessageBody("<p></p>", isHTML: true)

            present(mail, animated: true)
        } else {
            let errorAlerController = AlertsController.getErrorAlerController(error: .couldNotSendEmail)
            self.present(errorAlerController, animated: true, completion: nil)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

