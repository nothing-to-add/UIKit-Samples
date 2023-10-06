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
    
    let stackViewButton = UIButton()
    let tableViewButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackViewButton()
        setupTableViewButton()
        view.backgroundColor = .systemBackground
        title = "Main Screen"
    }
    
    func setupStackViewButton() {
        view.addSubview(stackViewButton)
        
        stackViewButton.configuration = .filled()
        stackViewButton.configuration?.baseBackgroundColor = .systemPink
        stackViewButton.configuration?.title = "Stack View"
        
        stackViewButton.addTarget(self, action: #selector(gotToStackViewScreen), for: .touchUpInside)
        
        stackViewButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackViewButton.widthAnchor.constraint(equalToConstant: 200),
            stackViewButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupTableViewButton() {
        view.addSubview(tableViewButton)
        
        tableViewButton.configuration = .filled()
        tableViewButton.configuration?.baseBackgroundColor = .systemPink
        tableViewButton.configuration?.title = "Table View"
        
        tableViewButton.addTarget(self, action: #selector(gotToTableViewScreen), for: .touchUpInside)
        
        tableViewButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableViewButton.topAnchor.constraint(equalTo: stackViewButton.bottomAnchor, constant: 20),
            tableViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableViewButton.widthAnchor.constraint(equalToConstant: 200),
            tableViewButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func gotToStackViewScreen() {
        let screen = StackViewScreen()
        navigationController?.pushViewController(screen, animated: true)
    }
    
    @objc func gotToTableViewScreen() {
        let screen = TableViewScreen()
        navigationController?.pushViewController(screen, animated: true)
    }
}

