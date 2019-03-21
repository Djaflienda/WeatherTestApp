//
//  HTTPTask.swift
//  WeatherMamsy
//
//  Created by Djaflienda on 19/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String: String]

public enum HTTPTask {
    
    case request
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, aditionalHeaders: HTTPHeaders?)
    
}
