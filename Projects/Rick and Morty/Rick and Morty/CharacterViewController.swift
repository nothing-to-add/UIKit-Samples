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
    var cardView = UIView()
    
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
        navigationItem.largeTitleDisplayMode = .never
        
        configureMyView()
        configureLabel()
        set(character: character)
    }
    
    private func set(character: Character) {
        titleLabel.text = character.name
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
    }
    
    private func configureLabel() {
        cardView.addSubview(titleLabel)
        titleLabel.backgroundColor = .clear
        titleLabel.pin(to: cardView)
    }
    
    private func configureMyView() {
        view.addSubview(cardView)
        let guide = view.safeAreaLayoutGuide
        cardView.frame = CGRect()
        cardView.backgroundColor = .systemGray
        cardView.pin(toCenter: guide)
        cardView.setSize(height: guide.layoutFrame.size.height - 200, width: guide.layoutFrame.size.width - 100)
        cardView.layer.cornerRadius = 10
    }

}
