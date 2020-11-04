//
//  StartViewController.swift
//  QuizApp_LabProject
//
//  Created by Thiên Trân on 2020-11-04.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let questionViewController = segue.destination as? QuestionViewController {
            let question = Question(category: "Food", type: .multiple, difficulty: .easy, question: "What is my favourite food?", correctAnswer: "🍕", inccorectAnswer: ["🐟","🍚","🥩"])
            questionViewController.question = question
        }
    }

}
