//
//  ParameterEncoder.swift
//  WeatherMamsy
//
//  Created by Djaflienda on 19/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

import Foundation

public typealias Parameters = [String: Any]

public protocol ParameterEncoder {
    
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
    
}

public enum NetworkError: String, Error {
    
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameters encoding failed."
    case missingURL = "URL is nil."
    
}
