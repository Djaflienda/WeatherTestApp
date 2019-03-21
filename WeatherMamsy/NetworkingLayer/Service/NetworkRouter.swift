//
//  NetworkRouter.swift
//  WeatherMamsy
//
//  Created by Djaflienda on 19/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

import Foundation

public typealias NetworkRouterComplition = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, complition: @escaping NetworkRouterComplition)
    func cancel()
}
