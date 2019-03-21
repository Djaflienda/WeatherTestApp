//
//  TableViewExtension.swift
//  WeatherMamsy
//
//  Created by Djaflienda on 20/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 190.0 : 78.0
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CityWeather.shared.cities[tableView.tag].list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewMainCell", for: indexPath) as! TableViewMainCell
            
            cell.configureCell(with: CityWeather.shared.cities[tableView.tag], for: indexPath.row)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewSecondary", for: indexPath) as! TableViewSecondary
            
            cell.configureCell(with: CityWeather.shared.cities[tableView.tag], for: indexPath.row)
            
            return cell
        }
    }
}
