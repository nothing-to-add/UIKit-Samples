//
//  File name: HttpError.swift
//  Project name: Rick and Morty
//  Workspace name: UIKit-Samples
//
//  Created by: nothing-to-add on 11/10/2023
//  Using Swift 5.0
//  Copyright (c) 2023 nothing-to-add
//

import Foundation

enum HttpError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case noSuchData
}

extension HttpError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString(
                "This URL is invalid",
                comment: ""
            )
        case .invalidResponse:
            return NSLocalizedString(
                "This Response is invalid",
                comment: ""
            )
        case .invalidData:
            return NSLocalizedString(
                "This Data is invalid",
                comment: ""
            )
        case .noSuchData:
            return NSLocalizedString(
                "This data does not have target",
                comment: ""
            )
        }
    }
}
