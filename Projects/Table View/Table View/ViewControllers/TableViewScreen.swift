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
            Video(image: Images.drone, title: "What is a Drone?"),
            Video(image: Images.mario, title: "The main hero of the Mushroom Kingdom"),
            Video(image: Images.trade, title: "Trade is the exchange of goods and services "),
            Video(image: Images.camera, title: "The word camera means room"),
            Video(image: Images.gameRemote, title: "Most gamepads also have two buttons in the middle"),
            Video(image: Images.tapes, title: "Symbolizes the adhesion of the adhesive tape"),
            Video(image: Images.motherboard, title: "A motherboard is the main printed circuit board"),
            Video(image: Images.cat, title: "Is My Cat Happy Indoors?"),
            Video(image: Images.vrSet, title: "A standalone VR headset does not require a PC"),
            Video(image: Images.island, title: "Adventure Island is opened all summer long"),
            Video(image: Images.gameBoy, title: "Access a collection of Game Boy™ games"),
            
        ]
    }
}
