//
//  ContactView.swift
//  QuizApp_LabProject
//
//  Created by Thiên Trân on 2020-11-22.
//

import UIKit

class ContactView: UIView {

    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let phoneLabel = UILabel()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.text = NSLocalizedString("Developer: Thien Tran", comment: "Developer info")
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        emailLabel.font = UIFont.preferredFont(forTextStyle: .body)
        emailLabel.adjustsFontForContentSizeCategory = true
        emailLabel.text = NSLocalizedString("Email: trqu19ba@student.ju.se", comment: "Email info")
        addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 20).isActive = true
        emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        phoneLabel.font = UIFont.preferredFont(forTextStyle: .body)
        phoneLabel.adjustsFontForContentSizeCategory = true
        phoneLabel.text = NSLocalizedString("Phone: 0764382246", comment: "Phone info")
        addSubview(phoneLabel)
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.topAnchor.constraint(equalTo: emailLabel.topAnchor, constant: 20).isActive = true
        phoneLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}

