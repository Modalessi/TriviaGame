//
//  ViewController.swift
//  Assaalny
//
//  Created by Mohammed Alessi on 23/03/2021.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var recordLabel: UILabel!
    
    
    func setRecordLabel() {
        
        let userDefults = UserDefultsManager()
        recordLabel.text = "\(userDefults.getRecord())"
        
    }
    
    // -MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setRecordLabel()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backButtonItem = UIBarButtonItem()
        
        if segue.identifier == "toGame" {
            backButtonItem.title = "الخروج"
        } else {
            backButtonItem.title = "الرجوع"
        }
        
        navigationItem.backBarButtonItem = backButtonItem
    }
    
}

