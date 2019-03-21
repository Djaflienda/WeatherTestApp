//
//  NetworkingManager.swift
//  WeatherMamsy
//
//  Created by Djaflienda on 19/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    static let environment: NetworkEnvironment = .weatherAPI
    let router = Router<WeatherAPI>()
    
    enum NetworkResponse: String {
        case success
        case authenticationError = "Authentication issues."
        case notUniqueUser = "User is already existed."
        case badRequest = "Bad request"
        case outdated = "The url you requested is outdated."
        case failed = "Network request failed."
        case noData = "Response returned with no data to decode."
        case unableToDecode = "We could not decode the response."
    }
    
    enum Result<String> {
        case success
        case failure(String)
    }
    
    func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299:
            return .success
        default:
            return .failure(NetworkResponse.failed.rawValue)
        }
    }
}


