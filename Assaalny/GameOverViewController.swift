//
//  GameOverViewController.swift
//  Assaalny
//
//  Created by Mohammed Alessi on 24/03/2021.
//

import UIKit

class GameOverViewController: UIViewController {
    
    var userDefultsManager = UserDefultsManager()
    var gamePoints: Int!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var recordLabel: UILabel!
    
    
    
    @IBAction func exitButtonTouched(_ sender: AButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        recordLabel.text = "\(userDefultsManager.getRecord())"
        pointsLabel.text = "\(gamePoints!)"
    }
    
}
