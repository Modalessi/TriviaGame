//
//  ErrorEnum.swift
//  Assaalny
//
//  Created by Mohammed Alessi on 24/03/2021.
//

import Foundation

enum Errors: Error {
    
    case couldNotReadJsonFile
    case couldNotSendEmail
    
    var message: String {
        switch self {
        case .couldNotReadJsonFile:
            return "حدث خطا ما اثناء تحميل الاسالة"
        case .couldNotSendEmail:
            return "لا يمكن ارسال بريد الكتروني بسبب خطا ما"
        
        }
    }
}
