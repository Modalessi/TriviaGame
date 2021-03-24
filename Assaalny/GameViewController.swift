//
//  GameViewController.swift
//  Assaalny
//
//  Created by Mohammed Alessi on 23/03/2021.
//

import UIKit

class GameViewController: UIViewController {
    
    var game: Game!
    var currentQuestion: Question! = nil
    
    var userDefults = UserDefultsManager()
    
    
    // -MARK: Outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionView: QuestionView!
    
    @IBOutlet weak var firstButton: AButton!
    @IBOutlet weak var secondButton: AButton!
    @IBOutlet weak var thirdButton: AButton!
    @IBOutlet weak var fourthButton: AButton!
    
    // -MARK: Actions
    
    @IBAction func choiecButtonTouched(_ sender: AButton) {
        if answerIsCorrect(sender.currentTitle!) {
            correctAnswerChoosed()
        } else {
            wrongAnswerChoosed()
        }
    }
    
    func correctAnswerChoosed() {
        game.points += 1
        viewQuestion()
    }
    
    
    
    func wrongAnswerChoosed() {
        game.tries -= 1
                
        if game.tries == 0 {
            
            userDefults.setRecord(game.points)
            
            let wrongAnswerAlerController = AlertsController.getWrongAnswerAlertController(tries: game.tries, completion: {(okButton) in
                self.dismiss(animated: true, completion: self.sendToGameOverView)
                
            })
            self.present(wrongAnswerAlerController, animated: true, completion: nil)
        } else {
            let wrongAnswerAlerController = AlertsController.getWrongAnswerAlertController(tries: game.tries, completion: nil)
            self.present(wrongAnswerAlerController, animated: true, completion: nil)
        }
        
    }
    
    func sendToGameOverView() {
        let gameOverViewControlle = self.storyboard?.instantiateViewController(identifier: "gameOverView") as! GameOverViewController
        gameOverViewControlle.gamePoints = game.points
        show(gameOverViewControlle, sender: nil)
    }
    
    func answerIsCorrect(_ answer: String)->Bool {
        if answer == currentQuestion.correctChoice {
            return true
        } else {
            return false
        }
    }
    
    func pickRandomQuestion()->Question {
        let randomIndex = Int.random(in: 0..<game.questoins.count)
        let pickedQuestion = game.questoins[randomIndex]
        
        game.questoins.remove(at: randomIndex)
        
        return pickedQuestion
    }
    
    // -MARK: preparing functions
    func creatGame() {
        do {
            game = try Game()
        } catch {
            let errorAlert = AlertsController.getErrorAlerController(error: .couldNotReadJsonFile)
            self.present(errorAlert, animated: true) {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func viewQuestion() {
        let question = pickRandomQuestion()
        currentQuestion = question
        let choices: [String] = [question.correctChoice, question.secondChoice, question.thirdChoice, question.fourthChoice].shuffled()
        
        questionLabel.text = question.question
        
        firstButton.setTitle(choices[0], for: .normal)
        secondButton.setTitle(choices[1], for: .normal)
        thirdButton.setTitle(choices[2], for: .normal)
        fourthButton.setTitle(choices[3], for: .normal)
        
        self.title = " السؤال " + "\(game.points + 1)"
        
        questionView.backgroundColor = ThemeColors.randomColor()
        
    }
    
    func setBackButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "الخروج", style: .plain, target: self, action: #selector(exitGameButtonTouched))
    }
    
    @objc
    func exitGameButtonTouched() {
        
        let attentionAlert = AlertsController.getAttentionAlertController { (yesBTN) in
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        self.present(attentionAlert, animated: true, completion: nil)
        
    }
    
    
    // -MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        creatGame()
        viewQuestion()
        setBackButton()
    }
        
}
                          
