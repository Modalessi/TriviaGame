//
//  Question.swift
//  Assaalny
//
//  Created by Mohammed Alessi on 23/03/2021.
//

import Foundation


class Question: Codable {
    
    let question: String
    let correctChoice: String
    let secondChoice: String
    let thirdChoice: String
    let fourthChoice: String
    
    
    init(question: String, correctChoice: String, secondChoice: String, thirdChoice: String, fourthChoice: String) {
        self.question = question
        self.correctChoice = correctChoice
        self.secondChoice = secondChoice
        self.thirdChoice = thirdChoice
        self.fourthChoice = fourthChoice
    }
    
}
