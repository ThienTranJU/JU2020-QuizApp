//
//  ResultView.swift
//  QuizApp_LabProject
//
//  Created by Thiên Trân on 2020-11-04.
//

import UIKit

class ResultView: UIView {
    
    let titleLabel = UILabel()
    let resultLabel = UILabel()
    let backgroundImage = UIImage(named: "backgroundImage")
    let backgroundImageView = UIImageView()
    let button = UIButton()
    let question1Label = UILabel()
    let question2Label = UILabel()
    let question3Label = UILabel()
    let question4Label = UILabel()
    let question5Label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundImageView.image = backgroundImage
        addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = NSLocalizedString("Your Result", comment: "Result title")
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        resultLabel.textColor = .white
        resultLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        resultLabel.adjustsFontForContentSizeCategory = true
        addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        resultLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
        
        question1Label.textColor = .white
        question1Label.font = UIFont.preferredFont(forTextStyle: .callout)
        question1Label.adjustsFontForContentSizeCategory = true
        question1Label.text = NSLocalizedString("_Question 1", comment: "Question 1 title")
        addSubview(question1Label)
        question1Label.translatesAutoresizingMaskIntoConstraints = false
        question1Label.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20).isActive = true
        question1Label.centerXAnchor.constraint(equalTo: resultLabel.centerXAnchor).isActive = true
        question1Label.lineBreakMode = .byWordWrapping
        question1Label.numberOfLines = 0
        question1Label.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -20).isActive = true
        
        question2Label.textColor = .white
        question2Label.font = UIFont.preferredFont(forTextStyle: .callout)
        question2Label.adjustsFontForContentSizeCategory = true
        question2Label.text = NSLocalizedString("_Question 2", comment: "Question 2 title")
        addSubview(question2Label)
        question2Label.translatesAutoresizingMaskIntoConstraints = false
        question2Label.topAnchor.constraint(equalTo: question1Label.bottomAnchor, constant: 20).isActive = true
        question2Label.centerXAnchor.constraint(equalTo: question1Label.centerXAnchor).isActive = true
        question2Label.lineBreakMode = .byWordWrapping
        question2Label.numberOfLines = 0
        question2Label.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -20).isActive = true
        
        question3Label.textColor = .white
        question3Label.font = UIFont.preferredFont(forTextStyle: .callout)
        question3Label.adjustsFontForContentSizeCategory = true
        question3Label.text = NSLocalizedString("_Question 3", comment: "Question 3 title")
        addSubview(question3Label)
        question3Label.translatesAutoresizingMaskIntoConstraints = false
        question3Label.topAnchor.constraint(equalTo: question2Label.bottomAnchor, constant: 20).isActive = true
        question3Label.centerXAnchor.constraint(equalTo: question2Label.centerXAnchor).isActive = true
        question3Label.lineBreakMode = .byWordWrapping
        question3Label.numberOfLines = 0
        question3Label.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -20).isActive = true
        
        question4Label.textColor = .white
        question4Label.font = UIFont.preferredFont(forTextStyle: .callout)
        question4Label.adjustsFontForContentSizeCategory = true
        question4Label.text = NSLocalizedString("_Question 4", comment: "Question 4 title")
        addSubview(question4Label)
        question4Label.translatesAutoresizingMaskIntoConstraints = false
        question4Label.topAnchor.constraint(equalTo: question3Label.bottomAnchor, constant: 20).isActive = true
        question4Label.centerXAnchor.constraint(equalTo: question3Label.centerXAnchor).isActive = true
        question4Label.lineBreakMode = .byWordWrapping
        question4Label.numberOfLines = 0
        question4Label.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -20).isActive = true
        
        question5Label.textColor = .white
        question5Label.font = UIFont.preferredFont(forTextStyle: .callout)
        question5Label.adjustsFontForContentSizeCategory = true
        question5Label.text = NSLocalizedString("_Question 5", comment: "Question 5 title")
        addSubview(question5Label)
        question5Label.translatesAutoresizingMaskIntoConstraints = false
        question5Label.topAnchor.constraint(equalTo: question4Label.bottomAnchor, constant: 20).isActive = true
        question5Label.centerXAnchor.constraint(equalTo: question4Label.centerXAnchor).isActive = true
        question5Label.lineBreakMode = .byWordWrapping
        question5Label.numberOfLines = 0
        question5Label.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -20).isActive = true
        
        button.setTitleColor(.systemRed, for: .normal)
        button.setTitle(NSLocalizedString("Back to menu", comment: "Result button title"), for: .normal)
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
}
