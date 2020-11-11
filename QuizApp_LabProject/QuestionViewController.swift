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
        
        var buttons = [buttonAnswerA, buttonAnswerB, buttonAnswerC, buttonAnswerD]
        buttons.forEach{(button) in
            button?.layer.cornerRadius = 20
        }
        
        labelQuestionTitle.layer.masksToBounds = true
        labelQuestionTitle.layer.cornerRadius = 20
        
        labelQuestionTitle.text = question?.question
        
        buttons.shuffle()
        let correctButton = buttons.removeFirst()
        correctButton?.setTitle(question?.correctAnswer, for: .normal)
        question?.inccorectAnswer.forEach({(answer) in
            let button = buttons.removeFirst()
            button?.setTitle(answer, for: .normal)
        })
        
    }
    
    @IBAction func buttonAnswerAHandler(_ sender: Any) {
        if buttonAnswerA.title(for: .normal) == question?.correctAnswer {
            showRightAnswerAlert(button: buttonAnswerA)
        } else {
            showWrongAnswerAlert(button: buttonAnswerA)
        }
    }
    
    @IBAction func buttonAnswerBHandler(_ sender: Any) {
        if buttonAnswerB.title(for: .normal) == question?.correctAnswer {
            showRightAnswerAlert(button: buttonAnswerB)
        } else {
            showWrongAnswerAlert(button: buttonAnswerB)
        }
    }
    
    @IBAction func buttonAnswerCHandler(_ sender: Any) {
        if buttonAnswerC.title(for: .normal) == question?.correctAnswer {
            showRightAnswerAlert(button: buttonAnswerC)
        } else {
            showWrongAnswerAlert(button: buttonAnswerC)
        }
    }
    @IBAction func buttonAnswerDHandler(_ sender: Any) {
        if buttonAnswerD.title(for: .normal) == question?.correctAnswer {
            showRightAnswerAlert(button: buttonAnswerD)
        } else {
            showWrongAnswerAlert(button: buttonAnswerD)
        }
        
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
            performSegue(withIdentifier: "ResultView", sender: nil)
            return
        }
        
        questionViewController.questions = questions
        questionViewController.numberOfQuestions = numberOfQuestions
        questionViewController.rightAnswers = rightAnswers
        navigationController?.pushViewController(questionViewController, animated: true)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultViewController = segue.destination as? ResultViewController {
            resultViewController.resultView.resultLabel.text = "You have \(rightAnswers) correct answers out of \(numberOfQuestions) questions"
        }
    }

}
