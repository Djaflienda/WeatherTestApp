//
//  extDouble.swift
//  WeatherMamsy
//
//  Created by Djaflienda on 21/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

extension Double {
    
    func convertToCelcius() -> Double {
        return self - 273.15
    }
    
    var inCelcius: Double {
        return self - 273.15
    }
}
