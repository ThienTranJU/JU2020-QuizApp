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
        //backgroundImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
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
        
        
        button.setTitleColor(.systemRed, for: .normal)
        button.setTitle(NSLocalizedString("Back to menu", comment: "Result button title"), for: .normal)
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
}
