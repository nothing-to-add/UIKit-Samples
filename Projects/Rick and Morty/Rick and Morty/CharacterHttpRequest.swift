//
//  File name: CharacterHttpRequest.swift
//  Project name: Rick and Morty
//  Workspace name: UIKit-Samples
//
//  Created by: nothing-to-add on 11/10/2023
//  Using Swift 5.0
//  Copyright (c) 2023 nothing-to-add
//

import Foundation

class CharacterHttpRequest {
    
    private func getRequest(endpoint: String) async throws -> (Data, HTTPURLResponse) {
        let basic = C.Url.basic.appending(endpoint)
        guard let encodedURL = basic.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: encodedURL) else {
            throw HttpError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return try await GenericHttpRequest().perform(request: request)
    }
    
//    private func decode(data: Data) async throws -> [Character] {
//        guard let characters = try? JSONDecoder().decode([Character].self, from: data) else {
//            throw HttpError.invalidData
//        }
//        return characters
//    }
    
    func getSingleCharacterById(id: Int) async throws -> Character {
        let (data, _) = try await getRequest(endpoint: C.Url.character.appending("/\(id)"))
        guard let character = try? JSONDecoder().decode(Character.self, from: data) else {
            throw HttpError.invalidData
        }
        return character
    }
    
    func let ref = db.queryOrdered(byChild: child).queryEqual(toValue: param)getCharacters() async throws -> Characters {
        let (data, _) = try await getRequest(endpoint: C.Url.character)
        guard let characters = try? JSONDecoder().decode(Characters.self, from: data) else {
            throw HttpError.invalidData
        }

        return characters
    }
}
