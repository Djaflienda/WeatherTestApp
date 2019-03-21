//
//  extUITableViewCell.swift
//  WeatherMamsy
//
//  Created by Djaflienda on 21/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

import UIKit

extension Int {
    
    func defineWeekday() -> String {
        let weekday = Calendar.current.component(.weekday, from: Date(timeIntervalSince1970: TimeInterval(self)))
        return DateFormatter().weekdaySymbols[weekday - 1]
    }
}

