//
//  WeatherAPI.swift
//  WeatherMamsy
//
//  Created by Djaflienda on 19/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case weatherAPI
}

public enum WeatherAPI {
    
    case weatherByLocation(lat: Float, lon: Float)
    case weatherByCity(city: String)
}

extension WeatherAPI: EndPointType {
    
    var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .weatherAPI:
            return "https://api.openweathermap.org/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .weatherByLocation:
            return "data/2.5/forecast/"
        case .weatherByCity:
            return "data/2.5/forecast/"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .weatherByLocation:
            return .get
        case .weatherByCity:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .weatherByLocation(let lat, let lon):
            return .requestParameters(bodyParameters: ["lat": lat, "lon": lon], urlParameters: ["appid=": "bf05810113f51cbe4635d12dbf41e83f"])
        case .weatherByCity(let city):
            return .requestParameters(bodyParameters: nil, urlParameters: ["q": city, "appid": "bf05810113f51cbe4635d12dbf41e83f"])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
