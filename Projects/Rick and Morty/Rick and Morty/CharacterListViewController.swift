//
//  File name: CharacterListViewController.swift
//  Project name: Rick and Morty
//  Workspace name: UIKit-Samples
//
//  Created by: nothing-to-add on 10/10/2023
//  Using Swift 5.0
//  Copyright (c) 2023 nothing-to-add
//

import UIKit

class CharacterListViewController: UIViewController {

    var tableView = UITableView()
    var characters: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        
        title = "All Characters"
        
        characters = fetchData()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(CharacterViewCell.self, forCellReuseIdentifier: CharacterViewCell.id)
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterViewCell.id) as! CharacterViewCell
        let character = characters[indexPath.row]
        cell.set(character: character)
        
        return cell
    }
}

extension CharacterListViewController {
    
    func fetchData() -> [Character] {
        return [
            Character(image: UIImage(systemName: "book")!, title: "Book"),
            Character(image: UIImage(systemName: "airplane")!, title: "Airplane"),
            Character(image: UIImage(systemName: "pencil")!, title: "Pencil")
        ]
    }
}

