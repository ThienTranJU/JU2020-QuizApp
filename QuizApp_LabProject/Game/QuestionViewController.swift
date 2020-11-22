//
//  QuestionViewController.swift
//  QuizApp_LabProject
//
//  Created by Thiên Trân on 2020-10-28.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var buttonAnswerA: UIButton!
    @IBOutlet weak var buttonAnswerB: UIButton!
    @IBOutlet weak var buttonAnswerC: UIButton!
    @IBOutlet weak var buttonAnswerD: UIButton!
    
    @IBOutlet weak var labelQuestionTitle: UILabel!
    
    private let gameResultDatabaseManager = GameResultDatabaseManager()
    
    var questionsArray : [Question] = []
    
    private var haveWon = false
    var questions: [Question] = [] {
        didSet {
            questions.shuffle()
            question = questions.removeFirst()
        }
    }
    var question: Question?
    var numberOfQuestions = 0
    var rightAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        var buttons = [buttonAnswerA, buttonAnswerB, buttonAnswerC, buttonAnswerD]
        buttons.forEach{(button) in
            button?.layer.cornerRadius = 20
        }
        
        labelQuestionTitle.layer.masksToBounds = true
        labelQuestionTitle.layer.cornerRadius = 20
        
        labelQuestionTitle.text = question?.question.htmlDecoded
        
        buttons.shuffle()
        let correctButton = buttons.removeFirst()
        correctButton?.setTitle(question?.correctAnswer.htmlDecoded, for: .normal)
        question?.incorrectAnswers.forEach({(answer) in
            let button = buttons.removeFirst()
            button?.setTitle(answer.htmlDecoded, for: .normal)
        })
        
    }
    
    @IBAction func buttonAnswerAHandler(_ sender: Any) {
        if checkIfItIsTheRightAnswer(forButton: buttonAnswerA) {
            showRightAnswerAlert(button: buttonAnswerA)
        } else {
            showWrongAnswerAlert(button: buttonAnswerA)
        }
    }
    
    @IBAction func buttonAnswerBHandler(_ sender: Any) {
        if checkIfItIsTheRightAnswer(forButton: buttonAnswerB) {
            showRightAnswerAlert(button: buttonAnswerB)
        } else {
            showWrongAnswerAlert(button: buttonAnswerB)
        }
    }
    
    @IBAction func buttonAnswerCHandler(_ sender: Any) {
        if checkIfItIsTheRightAnswer(forButton: buttonAnswerC) {
            showRightAnswerAlert(button: buttonAnswerC)
        } else {
            showWrongAnswerAlert(button: buttonAnswerC)
        }
    }
    @IBAction func buttonAnswerDHandler(_ sender: Any) {
        if checkIfItIsTheRightAnswer(forButton: buttonAnswerD) {
            showRightAnswerAlert(button: buttonAnswerD)
        } else {
            showWrongAnswerAlert(button: buttonAnswerD)
        }
        
    }
    
    func checkIfItIsTheRightAnswer(forButton button: UIButton) -> Bool {
        button.title(for: .normal) == question?.correctAnswer
    }
    
    private func showRightAnswerAlert (button: UIButton) {
        haveWon = true
        button.backgroundColor = .green
        rightAnswers += 1
        let alertController = UIAlertController(title: "Correct 🥳", message: "Good job!", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Next question", style: UIAlertAction.Style.default, handler: { (_) in
            self.goToNextScreen()
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    private func showWrongAnswerAlert (button: UIButton) {
        button.backgroundColor = .red
        let alertController = UIAlertController(title: "Wrong ☹️", message: "Maybe next time...", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Next question", style: UIAlertAction.Style.default, handler: { (_) in
            self.goToNextScreen()
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    private func goToNextScreen() {
        guard !questions.isEmpty,
              let questionViewController = storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController else {
            questionsArray.append(question!)
            saveGameResult()
            performSegue(withIdentifier: "ResultView", sender: nil)
            return
        }
        
        questionsArray.append(question!)

        questionViewController.questionsArray = questionsArray
        questionViewController.questions = questions
        questionViewController.numberOfQuestions = numberOfQuestions
        questionViewController.rightAnswers = rightAnswers
        navigationController?.pushViewController(questionViewController, animated: true)
        
    }
    
    // MARK: - Saving the result
    
    private func saveGameResult() {
        if gameResultDatabaseManager.create(withNumbersOfQuestions: numberOfQuestions, andRightAnswers: rightAnswers) != nil {
            gameResultDatabaseManager.save()
        }
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultViewController = segue.destination as? ResultViewController {
            resultViewController.resultView.question1Label.text?.append("(" + questionsArray[0].difficulty.rawValue.capitalized + "/" + questionsArray[0].category + "): " + questionsArray[0].question.htmlDecoded! + " - " + questionsArray[0].correctAnswer.htmlDecoded!)
            
            resultViewController.resultView.question2Label.text?.append("(" + questionsArray[1].difficulty.rawValue.capitalized + "/" + questionsArray[1].category + "): " + questionsArray[1].question.htmlDecoded! + " - " + questionsArray[1].correctAnswer.htmlDecoded!)
            
            resultViewController.resultView.question3Label.text?.append("(" + questionsArray[2].difficulty.rawValue.capitalized + "/" + questionsArray[2].category + "): " + questionsArray[2].question.htmlDecoded! + " - " + questionsArray[2].correctAnswer.htmlDecoded!)
            
            resultViewController.resultView.question4Label.text?.append("(" + questionsArray[3].difficulty.rawValue.capitalized + "/" + questionsArray[3].category + "): " + questionsArray[3].question.htmlDecoded! + " - " + questionsArray[3].correctAnswer.htmlDecoded!)
            
            resultViewController.resultView.question5Label.text?.append("(" + questionsArray[4].difficulty.rawValue.capitalized + "/" + questionsArray[4].category + "): " + questionsArray[4].question.htmlDecoded! + " - " + questionsArray[4].correctAnswer.htmlDecoded!)
            
            resultViewController.resultView.resultLabel.text = "You have \(rightAnswers) correct answers out of \(numberOfQuestions) questions"
        }
    }

}
