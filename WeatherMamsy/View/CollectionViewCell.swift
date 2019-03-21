//
//  CollectionViewCell.swift
//  WeatherMamsy
//
//  Created by MacBook-Игорь on 19/03/2019.
//  Copyright © 2019 MacBook-Игорь. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    //MARK: - @IBOutlet
    
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - Properties
    
    //MARK: - Init
    
    //MARK: - Handlers    
    
    func setTableView(dataSourceDelegate: UITableViewDataSource & UITableViewDelegate, forRow row: Int) {
        tableView.delegate = dataSourceDelegate
        tableView.dataSource = dataSourceDelegate
        tableView.tag = row
        tableView.reloadData()
    }
}


