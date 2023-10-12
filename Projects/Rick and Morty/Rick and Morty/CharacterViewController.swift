//
//  File name: CharacterViewController.swift
//  Project name: Rick and Morty
//  Workspace name: UIKit-Samples
//
//  Created by: nothing-to-add on 10/10/2023
//  Using Swift 5.0
//  Copyright (c) 2023 nothing-to-add
//

import UIKit

class CharacterViewController: UIViewController {

    private let character: Character
    var titleLabel = UILabel()
    
    init(character: Character) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureLabel()
        set(character: character)
    }
    
    func set(character: Character) {
        titleLabel.text = character.name
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
    }
    
    func configureLabel() {
        view.addSubview(titleLabel)
        titleLabel.pin(to: view)
    }

}
