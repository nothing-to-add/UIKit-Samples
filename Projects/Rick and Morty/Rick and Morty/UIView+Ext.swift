//
//  File name: UIView+Ext.swift
//  Project name: Rick and Morty
//  Workspace name: UIKit-Samples
//
//  Created by: nothing-to-add on 10/10/2023
//  Using Swift 5.0
//  Copyright (c) 2023 nothing-to-add
//

import UIKit

extension UIView {
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
    
    func pin(to superView: UILayoutGuide) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
    
    func pin(toCenter superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            centerYAnchor.constraint(equalTo: superView.centerYAnchor)
        ])
    }
    
    func pin(toCenter superView: UILayoutGuide) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            centerYAnchor.constraint(equalTo: superView.centerYAnchor)
        ])
    }
    
    func setSize(height h: CGFloat, width w: CGFloat) {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: h),
            widthAnchor.constraint(equalToConstant: w)
        ])
    }
}
