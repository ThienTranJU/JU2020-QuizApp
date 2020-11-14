//
//  Question.swift
//  QuizApp_LabProject
//
//  Created by Thiên Trân on 2020-11-04.
//

import Foundation

struct Question: Decodable {
    
    enum QuestionType: String, Decodable {
        case multiple
    }
    
    enum Difficulty: String, Decodable {
        case easy, medium, hard
    }
    
    let category: String
    let type: QuestionType
    let difficulty: Difficulty
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
}
