//
//  CompaniesTableViewController.swift
//  CampusCash
//
//  Created by Tyler Jordan Cagle on 8/11/17.
//  Copyright © 2017 Hans von Clemm. All rights reserved.
//

import UIKit

struct cellData {
    
    let cell: Int!
    let text: String!
    let image: UIImage!
    
}

class CompaniesTableViewController: UITableViewController {
    
    var arrayOfCellData = [cellData]()
    
    override func viewDidLoad() {
        arrayOfCellData = [cellData(cell: 1, text: "Cosmos", image: #imageLiteral(resourceName: "Automotive")),
                            cellData(cell: 1, text: "Bosslady", image: #imageLiteral(resourceName: "Health")),
                            cellData(cell: 1, text: "Friyay", image: #imageLiteral(resourceName: "campus"))]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        <#code#>
    }
    
    }
