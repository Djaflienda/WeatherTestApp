//
//  EditViewController.swift
//  WeatherMamsy
//
//  Created by Djaflienda on 21/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

import UIKit

protocol EditCityDelegate {
    
    func removeCell()
}

class EditViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var delegate: EditCityDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
        navigationController?.isToolbarHidden = true
        
        self.title = "Cities"
    }

}

extension EditViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CityWeather.shared.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        cell.textLabel?.text = CityWeather.shared.cities[indexPath.row].city.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        CityWeather.shared.cities.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        delegate?.removeCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
