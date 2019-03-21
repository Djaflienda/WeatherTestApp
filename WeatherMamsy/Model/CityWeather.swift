//
//  CityWeather.swift
//  WeatherMamsy
//
//  Created by Djaflienda on 20/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

import Foundation

class CityWeather {
    
    static let shared = CityWeather()
    
    var cities: [WeatherData] = [WeatherData.init(list: [], city: CityInfo.init(name: "Moscow")), WeatherData.init(list: [], city: CityInfo.init(name: "London")), WeatherData.init(list: [], city: CityInfo.init(name: "Paris"))]
    
    private init() {}
    
    func saveAtFile() {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Cities.plist")
        print(path)
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(cities)
            try data.write(to: path, options: .atomic)
            print("Save successfully")
        } catch {
            print("Error encoding cities array")
        }
    }
    
    func loadFromFile() {
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Cities.plist")
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                cities = try decoder.decode([WeatherData].self, from: data)
                print("Load successfully")
            } catch {
                print("Error decoding cities array")
            }
        }
    }
}


