//
//  ThemeColors.swift
//  Assaalny
//
//  Created by Mohammed Alessi on 24/03/2021.
//

import UIKit

class ThemeColors {
    static var red = #colorLiteral(red: 0.9405000806, green: 0.4668195844, blue: 0.426746428, alpha: 1)
    static var blue = #colorLiteral(red: 0.5941296816, green: 0.7748442292, blue: 0.9790809751, alpha: 1)
    static var green = #colorLiteral(red: 0.507348001, green: 0.9163544774, blue: 0.5834636688, alpha: 1)
    static var lightRed = #colorLiteral(red: 0.8843144774, green: 0.6591742635, blue: 0.5751666427, alpha: 1)
    
    static func randomColor()->UIColor {
        let colors = [red, blue, green, lightRed].shuffled()
        return colors[0]
    }
    
}
