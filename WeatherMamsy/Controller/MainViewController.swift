//
//  MainViewController.swift
//  WeatherMamsy
//
//  Created by MacBook-Игорь on 18/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlet

    @IBOutlet private weak var collectionView: UICollectionView!
    
    //MARK: - Properties
    
    private let net = NetworkManager()

    //MARK: -Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        for i in CityWeather.shared.cities.enumerated() {
            fetchData(for: i.element, with: i.offset)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        navigationController?.isToolbarHidden = false
    }
    
    //MARK: - Handlers
    
    @IBAction func performAddCityScreen(_ sender: UIBarButtonItem) {
        sender.tag == 0 ? performAddNewCityScreen() : performEditScreen()
    }
    
    private func fetchData(for element: WeatherData, with offset: Int) {
        net.weatherByCity(city: element.city.name) { (weather, error) in

            if let error = error {
                self.showAlert(with: error)
                return
            }
            guard let weather = weather else { return }
            CityWeather.shared.cities[offset] = weather
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension ViewController: ChangeCityDelegate, EditCityDelegate {
    
    func userEnteredANewCityName(city: String) {
        
        let newData = WeatherData.init(list: [], city: CityInfo.init(name: "\(city)"))
        CityWeather.shared.cities.insert(newData, at: 0)
        CityWeather.shared.saveAtFile()
        fetchData(for: newData, with: 0)
    }
    
    func removeCell() {
        self.collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let collectionViewCell = cell as? CollectionViewCell else { return }
        collectionViewCell.setTableView(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return CityWeather.shared.cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
}
