//
//  extUIViewController.swift
//  WeatherMamsy
//
//  Created by Djaflienda on 20/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(with message: String) {
        
        let alert = UIAlertController(title: "Connection Issues", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func performAddNewCityScreen() {
        let destinationVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "AddNewCityViewController") as! AddNewCityViewController
        destinationVC.delegate = self as? ChangeCityDelegate
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func performEditScreen() {
        let destinationVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        destinationVC.delegate = self as? EditCityDelegate
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}
