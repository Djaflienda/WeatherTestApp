//
//  TableViewMainCell.swift
//  WeatherMamsy
//
//  Created by Djaflienda on 19/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

import UIKit

class TableViewMainCell: UITableViewCell {
    
    //MARK: - @IBOutlets

    @IBOutlet weak var cityTitleLabel: UILabel!
    @IBOutlet weak var conditionsLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var minTemperature: UILabel!
    @IBOutlet weak var maxTemperature: UILabel!
        
    @IBOutlet weak var conditionImage: UIImageView!
    //MARK: - Properties
    
    //MARK: - Init
    
    //MARK: - Handlers
    
    func configureCell(with data: WeatherData, for row: Int) {
        
        cityTitleLabel.text = data.city.name
        conditionsLabel.text = data.list[row].weather[row].description
        temperatureLabel.text = "\(Int(data.list[row].main.temp.inCelcius))°"
        
        dateLabel.text = data.list[row].dt.defineWeekday() + " Today"
        
        minTemperature.text = "\(Int(data.list[row].main.temp_min.inCelcius))°"
        maxTemperature.text = "\(Int(data.list[row].main.temp_max.inCelcius))°"
        
        let conditionImage = data.defineConditionImage(condition: data.list[row].weather[row].id)
        self.conditionImage.image = UIImage(named: conditionImage)
    }
}
