//
//  File name: ViewController.swift
//  Project name: Table View
//  Workspace name: UIKit-Samples
//
//  Created by: nothing-to-add on 06/10/2023
//  Using Swift 5.0
//  Copyright (c) 2023 nothing-to-add
//

import UIKit

class ViewController: UIViewController {
    
    let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    
    func setupButton() {
        view.addSubview(nextButton)
        
        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .systemPink
        nextButton.configuration?.title = "Next"
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

