//
//  RoundedButton.swift
//  Assaalny
//
//  Created by Mohammed Alessi on 23/03/2021.
//

import UIKit

class AButton: UIButton {
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 25
    }

}
