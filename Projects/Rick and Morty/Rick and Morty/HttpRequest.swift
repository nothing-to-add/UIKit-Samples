//
//  File name: HttpRequest.swift
//  Project name: Rick and Morty
//  Workspace name: UIKit-Samples
//
//  Created by: nothing-to-add on 11/10/2023
//  Using Swift 5.0
//  Copyright (c) 2023 nothing-to-add
//

import Foundation

protocol HTTPClient {
    func perform(request: URLRequest) async throws -> (Data, HTTPURLResponse)
}

class GenericHttpRequest: HTTPClient {
    func perform(request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let resp = response as? HTTPURLResponse, resp.statusCode == 201 else {
            throw HttpError.invalidResponse
        }
        return (data, resp)
    }
}
