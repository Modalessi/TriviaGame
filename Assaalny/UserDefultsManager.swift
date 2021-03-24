//
//  UserDefultsManager.swift
//  Assaalny
//
//  Created by Mohammed Alessi on 24/03/2021.
//

import Foundation

class UserDefultsManager {
    
    struct Keys {
        static var record = "record"
    }
    
    var userDefults = UserDefaults()
    
    
    func buildUserDefults() {
        if userDefults.value(forKey: Keys.record) == nil {
            userDefults.set(0, forKey: Keys.record)
        }
    }
    
    func getRecord()-> Int {
        return userDefults.value(forKey: Keys.record) as! Int
    }
    
    func setRecord(_ record: Int) {
        if record > getRecord() {
            userDefults.set(record, forKey: Keys.record)
        }
    }
    
}
