//
//  StartViewController.swift
//  QuizApp_LabProject
//
//  Created by Thiên Trân on 2020-11-04.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    var questions: [Question] = []
    var questionDifficulty = "easy"
    var numberOfQuestions = 3
    @IBOutlet weak var difficultySegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberOfQuestionsSlider: UISlider!
    @IBOutlet weak var numberOfQuestionsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //startButton.isEnabled = false
        //downloadQuestions(amount: 5, difficulty: questionDifficulty)
        
        nameTextField.placeholder = "Your name"
        nameTextField.delegate = self
        nameTextField.returnKeyType = .done
        
        if let name = UserDefaults.standard.string(forKey: "username") {
            nameTextField.text = name
        }
    }
    
    @IBAction func sliderHandler(_ sender: Any) {
        numberOfQuestions = Int(numberOfQuestionsSlider.value)
        numberOfQuestionsLabel.text = "\(Int(numberOfQuestionsSlider.value))"
    }
    @IBAction func difficultySegmentHandler(_ sender: Any) {
        questionDifficulty = difficultySegmentedControl.titleForSegment(at: difficultySegmentedControl.selectedSegmentIndex) ?? "easy"
    }
    @IBAction func highscoreButtonHandler(_ sender: Any) {
        let highscoreTableViewController = HighscoreTableViewController()
        navigationController?.pushViewController(highscoreTableViewController, animated: true)
    }
    @IBAction func startButtonHandler(_ sender: Any) {
        downloadQuestions(amount: numberOfQuestions, difficulty: questionDifficulty)
    }
    
    private func downloadQuestions(amount: Int, difficulty: String) {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=\(amount)&type=multiple&difficulty=\(difficulty)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard let data = data else {
                print(error ?? "error")
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let questionsResult = try? decoder.decode(QuestionsResult.self, from: data)
            self?.questions = questionsResult?.results ?? []
            
            DispatchQueue.main.async {
                //self?.startButton.isEnabled = true
                self?.startQuiz()
            }
            
        }
        
        task.resume()
    }
    
    private func startQuiz() {
        performSegue(withIdentifier: "QuestionView", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let questionViewController = segue.destination as? QuestionViewController {
//            let questionVariation1 = Question(category: "Food", type: .multiple, difficulty: .easy, question: "What is my favourite food?", correctAnswer: "🍕", incorrectAnswers: ["🐟","🍚","🥩"])
//            let questionVariation2 = Question(category: "Drink", type: .multiple, difficulty: .medium, question: "What is my favourite drink?", correctAnswer: "🍻", incorrectAnswers: ["🧉","🍷","☕️"])
//            let questionVariation3 = Question(category: "Emotion", type: .multiple, difficulty: .easy, question: "What is my favourite emotion", correctAnswer: "🤩", incorrectAnswers: ["🥳","🤪","🤨"])
//            let questions = [questionVariation1,questionVariation2,questionVariation3]
            questionViewController.questions = questions
            questionViewController.numberOfQuestions = questions.count
            questionViewController.questionDifficulty = questionDifficulty
        }
    }

    @IBAction func exampleButtonHandler(_ sender: Any) {
        let scrollViewController = ExampleScrollViewController()
        navigationController?.pushViewController(scrollViewController, animated: true)
    }
}

// MARK: - Text field delegate

extension StartViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let name = textField.text else {
            return
        }
        UserDefaults.standard.setValue(name, forKey: "username")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
