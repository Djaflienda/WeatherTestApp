//
//  WeatherData.swift
//  WeatherMamsy
//
//  Created by MacBook-Игорь on 19/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    
//    var cod: String
//    var message: Double
//    var cnt: Int
    
    var list: [CityWeatherData]
    
    var city: CityInfo
    
    func defineConditionImage(condition: Int) -> String {
        
        switch condition {
        case 200...300: return "200"
        case 300...321: return "300"
        case 500...531: return "500"
        case 600...622: return "600"
        case 701...781: return "701"
        case 800: return "800"
        case 801: return "801"
        case 802: return "802"
        case 803...804: return "803"
        default: return "day"
        }
    }
}

struct CityWeatherData: Codable {
    
    var dt: Int
    var main: MainData
    
    struct MainData: Codable {
        
        var temp: Double
        var temp_min: Double
        var temp_max: Double
//        var pressure: Double
//        var sea_level: Double
//        var grnd_level: Double
//        var humidity: Int
//        var temp_kf: Double
    }
    
    var weather: [Weather]
    
    struct Weather: Codable {
        
        var id: Int
        var main: String
        var description: String
        var icon: String
    }
    
//    var clouds: Clouds
//    
//    struct Clouds: Decodable {
//        
//        var all: Int
//    }
    
//    var wind: Wind
//
//    struct Wind: Decodable {
//        var speed: Double
//        var deg: Double
//    }
    
//    var sys: Sys
//
//    struct Sys: Decodable {
//        var pod: String
//    }
    
    var dt_txt: String
}

struct CityInfo: Codable {
    
//    var id: Int
    var name: String
//    var coord: Coord
    
//    struct Coord: Decodable {
//
//        var lat: Double
//        var lon: Double
//    }
    
//    var country: String
}
