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
    private var titleLabel = UILabel()
    private var cardView = UIView()
    private var avatar = UIImageView()
    private var mainStackView = UIStackView()
    private var textStackView = UIStackView()
    private var smallSide = 0.0
    private var bigSide = 0.0
    
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
        
        getSideValues()
        
        configureMainStack()
        configureCardView()
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
    
    private func configureCardView() {
        view.addSubview(cardView)
        let guide = view.safeAreaLayoutGuide
        cardView.frame = CGRect()
        cardView.backgroundColor = .systemGray
        cardView.pin(toCenter: guide)
        cardView.setSize(height: guide.layoutFrame.size.height - 200, width: guide.layoutFrame.size.width - 100)
        cardView.layer.cornerRadius = 10
    }
    
    private func getSideValues() {
        let guide = view.safeAreaLayoutGuide
        if guide.layoutFrame.size.height > guide.layoutFrame.size.width {
            smallSide = guide.layoutFrame.size.width
            bigSide = guide.layoutFrame.size.height
        }
    }
    
    private func configureMainStack() {
        cardView.addSubview(mainStackView)
        mainStackView.distribution = .fillEqually
        mainStackView.pin(to: cardView)
    }
    
    private func configureAvatar() {
        
    }
    
    private func getImage(url: String) async throws -> UIImage {
        do {
            guard let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: encodedURL) else {
                throw HttpError.invalidURL
            }
            
            let request = URLRequest(url: url)
            let (data, _) = try await GenericHttpRequest().perform(request: request)
            if let image = UIImage(data: data) {
                return image
            }
        } catch {
            print(error.localizedDescription)
        }
        return UIImage(systemName: "questionmark")!
    }
    
    private func orientationValue<T> (portrait: T, landscape: T) -> T {
        return UIDevice.current.orientation.isPortrait ? portrait : landscape
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        view.backgroundColor = orientationValue(portrait: .brown, landscape: .cyan)
    }
    

}
