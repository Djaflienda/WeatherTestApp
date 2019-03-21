//
//  EndPointType.swift
//  WeatherMamsy
//
//  Created by Djaflienda on 19/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

import Foundation

protocol EndPointType {
    
    var baseURL: URL { get }
    
    var path: String { get }
    
    var httpMethod: HTTPMethod { get }
    
    var task: HTTPTask { get }
    
    var headers: HTTPHeaders? { get }
    
}
