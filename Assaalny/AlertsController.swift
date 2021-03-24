//
//  AlertsController.swift
//  Assaalny
//
//  Created by Mohammed Alessi on 24/03/2021.
//

import UIKit


class AlertsController {
    
    static func getErrorAlerController(error: Errors)-> UIAlertController {
        let errorAlertController = UIAlertController(title: "عذرا", message: error.message, preferredStyle: .alert)
        errorAlertController.addAction(UIAlertAction(title: "موافق", style: .cancel, handler: nil))
        
        return errorAlertController
    }
    
    static func getWrongAnswerAlertController(tries: Int, completion: ((UIAlertAction)->Void)?)-> UIAlertController {
        var triesString: String {
            switch tries {
            case 2 :
                return "تبقى لديك محاولتين فقط"
            case 1 :
                return "تبقى لديك محاولة واحدة فقط"
            case 0 :
                return "لم يتبقى لديك اي محاولة"
            default :
                return ""
            }
        }
        
        let wrongAnswerAlerController = UIAlertController(title: "اجابة خاطئة", message: "\(triesString)", preferredStyle: .alert)
        wrongAnswerAlerController.addAction(UIAlertAction(title: "موافق", style: .cancel, handler: completion))
        
        return wrongAnswerAlerController
    }
    
    static func getAttentionAlertController(yesCompletion: ((UIAlertAction)->Void)?)->UIAlertController {
        
        let attentionAlertController = UIAlertController(title: "تنبيه", message: "هل انت متاكد من خروجك ؟ لن يتم احتساب نقاطك", preferredStyle: .alert)
        attentionAlertController.addAction(UIAlertAction(title: "نعم", style: .destructive, handler: yesCompletion))
        
        attentionAlertController.addAction(UIAlertAction(title: "لا", style: .cancel, handler: nil))
        
        return attentionAlertController
    }
  
    
}
