//
//  File name: StackViewScreen.swift
//  Project name: Table View
//  Workspace name: UIKit-Samples
//
//  Created by: nothing-to-add on 06/10/2023
//  Using Swift 5.0
//  Copyright (c) 2023 nothing-to-add
//

import UIKit

class StackViewScreen: UIViewController {
    
    var stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        title = "Stack View Screen"
        
        configureStackView()
    }
    
    func configureStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        addButtonsToStackView()
        setStackViewConstraints()
    }
    
    func addButtonsToStackView() {
        let numberOfButtons = 10
        
        for i in 1...numberOfButtons {
            let button = SurveyButton()
            button.setTitle("\(i)", for: .normal)
            stackView.addArrangedSubview(button)
        }
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
            
        ])
    }

}
