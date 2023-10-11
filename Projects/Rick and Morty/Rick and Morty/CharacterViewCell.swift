//
//  File name: CharacterViewCell.swift
//  Project name: Rick and Morty
//  Workspace name: UIKit-Samples
//
//  Created by: nothing-to-add on 10/10/2023
//  Using Swift 5.0
//  Copyright (c) 2023 nothing-to-add
//

import UIKit

class CharacterViewCell: UITableViewCell {
    
    static let id = "CharacterViewCell"
    var cellImageView = UIImageView()
    var cellTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(cellImageView)
        addSubview(cellTitleLabel)
        
        configureImageView()
        configureTitleLabel()
        
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(character: Character) {
        Task {
            cellImageView.image = try await getImage(url: character.image)
        }
        cellTitleLabel.text = character.name
    }
    
    private func getImage(url: String) async throws -> UIImage {
        do {
            guard let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: encodedURL) else {
                throw HttpError.invalidURL
            }
            
            let request = URLRequest(url: url)
            let (data, _) = try await GenericHttpRequest().perform(request: request)
            return UIImage(data: data) ?? UIImage(systemName: "questionmark")!
        } catch {
            print(error.localizedDescription)
        }
        return UIImage(systemName: "questionmark")!
    }
    
    func configureImageView() {
        cellImageView.layer.cornerRadius = 10
        cellImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        cellTitleLabel.numberOfLines = 0
        cellTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        cellImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        cellImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        cellImageView.widthAnchor.constraint(equalTo: cellImageView.heightAnchor).isActive = true
    }
    
    func setTitleLabelConstraints() {
        cellTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        cellTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cellTitleLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 20).isActive = true
        cellTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        cellTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
