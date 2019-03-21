//
//  WeatherByCity.swift
//  WeatherMamsy
//
//  Created by Djaflienda on 19/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

import Foundation

extension NetworkManager {
    
    func weatherByCity(city: String, complition: @escaping (_ weatherData: WeatherData?, _ error: String?) -> ()) {
        router.request(.weatherByCity(city: city)) { (data, response, error) in
            if error != nil {
                complition(nil, "Please check your network connection.")
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                guard let responseData = data else {
                    complition(nil, NetworkResponse.noData.rawValue)
                    return
                }
                switch result {
                case .success:
                    do {
                        var apiResponse = try JSONDecoder().decode(WeatherData.self, from: responseData)
                        print(apiResponse)
                        for i in apiResponse.list.enumerated().reversed() {
                            if i.offset != 0 && !(i.element.dt_txt.contains("00:00:00")) {
                                apiResponse.list.remove(at: i.offset)
                            }
                        }
                        complition(apiResponse, nil)
                    } catch {
                        complition(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(_):
                    complition(nil, NetworkResponse.unableToDecode.rawValue)
                }
            }
        }
    }
}
