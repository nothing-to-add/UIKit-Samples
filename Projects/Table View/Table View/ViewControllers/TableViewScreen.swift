//
//  File name: TableViewScreen.swift
//  Project name: Table View
//  Workspace name: UIKit-Samples
//
//  Created by: nothing-to-add on 06/10/2023
//  Using Swift 5.0
//  Copyright (c) 2023 nothing-to-add
//

import UIKit

class TableViewScreen: UIViewController {
    
    var tableView = UITableView()
    var videos: [Video] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        
        title = "Table View Screen"
        
        videos = fetchData()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.id)
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension TableViewScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.id) as! TableViewCell
        let video = videos[indexPath.row]
        cell.set(video: video)
        
        return cell
    }
}

extension TableViewScreen {
    
    func fetchData() -> [Video] {
        return [
            Video(image: UIImage(systemName: "book")!, title: "Book"),
            Video(image: UIImage(systemName: "airplane")!, title: "Airplane"),
            Video(image: UIImage(systemName: "car")!, title: "Car"),
            Video(image: UIImage(systemName: "pencil")!, title: "Pencil"),
            Video(image: UIImage(systemName: "eraser")!, title: "Eraser"),
            Video(image: UIImage(systemName: "trash")!, title: "Trash"),
            Video(image: UIImage(systemName: "folder")!, title: "Folder"),
            Video(image: UIImage(systemName: "externaldrive")!, title: "External Drive"),
            Video(image: UIImage(systemName: "clipboard")!, title: "Clipboard"),
            Video(image: UIImage(systemName: "calendar")!, title: "Calendar"),
            Video(image: UIImage(systemName: "menucard")!, title: "Menu Card"),
            
        ]
    }
}
