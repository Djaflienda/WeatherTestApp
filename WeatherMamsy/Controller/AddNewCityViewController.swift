//
//  AddNewCityViewController.swift
//  WeatherMamsy
//
//  Created by Djaflienda on 20/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

import UIKit

protocol ChangeCityDelegate {
    
    func userEnteredANewCityName(city: String)
}

class AddNewCityViewController: UIViewController {

    var delegate: ChangeCityDelegate?
    
    @IBOutlet weak var cityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
        navigationController?.isToolbarHidden = true
        
        self.title = "Add New City"
    }

    @IBAction func addCityButtonPressed(_ sender: UIButton) {
        
        guard let cityTitle = cityTextField.text, !cityTitle.isEmpty else { return }
        
        for i in CityWeather.shared.cities {
            if i.city.name.lowercased() == cityTitle.lowercased() {
                navigationController?.popViewController(animated: true)
                return
            }
        }
        
        delegate?.userEnteredANewCityName(city: cityTitle)
        navigationController?.popViewController(animated: true)
    }
}
