//
//  Game.swift
//  Assaalny
//
//  Created by Mohammed Alessi on 23/03/2021.
//

import Foundation


class Game {
    
    var questoins: [Question]! = nil
    var points: Int = 0
    var tries: Int = 3
    
    init() throws {
        do {
            try readQuestionsJsonFile()
        } catch {
            throw Errors.couldNotReadJsonFile
        }
    }
    
                    
    
    func readQuestionsJsonFile() throws {
        let questionJsonFile = Bundle.main.url(forResource: "questions", withExtension: "json")!
        do  {
            let data = try Data(contentsOf: questionJsonFile)
            self.questoins = try JSONDecoder().decode([Question].self, from: data)
        } catch {
            throw Errors.couldNotReadJsonFile
        }
    }
    
    
}
