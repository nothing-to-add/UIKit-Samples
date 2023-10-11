//
//  File name: Character.swift
//  Project name: Rick and Morty
//  Workspace name: UIKit-Samples
//
//  Created by: nothing-to-add on 10/10/2023
//  Using Swift 5.0
//  Copyright (c) 2023 nothing-to-add
//

import UIKit

struct Characters: Codable {
    let info: CharacterInfo
    let results: [Character]
}

struct CharacterInfo: Codable {
    let count, pages: Int
    let next, prev: String?
}

struct Character: Codable {
    let id: Int
    let name, status, species, type, gender: String
    let origin: CharacterOrigin
    let location: CharacterLocation
    let image: String
    let episode: [String]
    let url, created: String
}

struct CharacterOrigin: Codable {
    let name, url: String
}

struct CharacterLocation: Codable {
    let name, url: String
}
