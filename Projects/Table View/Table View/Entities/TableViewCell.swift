//
//  File name: TableViewCell.swift
//  Project name: Table View
//  Workspace name: UIKit-Samples
//
//  Created by: nothing-to-add on 06/10/2023
//  Using Swift 5.0
//  Copyright (c) 2023 nothing-to-add
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let id = "TableViewCell'"
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
    
    func set(video: Video) {
        cellImageView.image = video.image
        cellTitleLabel.text = video.title
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
        cellImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        cellImageView.widthAnchor.constraint(equalTo: cellImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setTitleLabelConstraints() {
        cellTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        cellTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cellTitleLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 20).isActive = true
        cellTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        cellTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
//    
//    
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        
//        // Configure the view for the selected state
//    }
    
}
