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
    let companyText: String!
    let addressText: String!
    let phoneNumberText: String!
    let websiteText: String!
    let couponImage: UIImage!
    
}

class CompaniesTableViewController: UITableViewController {
    
    var arrayOfCellData = [cellData]()
    
    override func viewDidLoad() {
        arrayOfCellData = [cellData(cell: 1, companyText: "Cosmos", addressText: "659 30th St, Boulder", phoneNumberText: "303-447-1133", websiteText: "cosmospizza.com", couponImage: #imageLiteral(resourceName: "Cosmos")),
                            cellData(cell: 1, companyText: "Half Fast Subs", addressText: "1215 13th Street", phoneNumberText: "303-449-0404", websiteText: "halffastsubs.com", couponImage: #imageLiteral(resourceName: "Half Fast Subs")),
                            cellData(cell: 1, companyText: "The Corner", addressText: "2115 13th Street, corner of 13th & College", phoneNumberText: "720-398-8331", websiteText: "thecornerboulder.com", couponImage: #imageLiteral(resourceName: "The Corner"))]
        
        self.navigationController?.navigationBar.isHidden = false
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if arrayOfCellData[indexPath.row].cell == 1 {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            
            cell.mainImageView.image = arrayOfCellData[indexPath.row].couponImage
            cell.companyLabel.text = arrayOfCellData[indexPath.row].companyText
            cell.addressLabel.text = arrayOfCellData[indexPath.row].addressText
            cell.phoneNumberLabel.text = arrayOfCellData[indexPath.row].phoneNumberText
            cell.websiteLabel.text = arrayOfCellData[indexPath.row].websiteText
            
            return cell
            
        } else {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            
            cell.mainImageView.image = arrayOfCellData[indexPath.row].couponImage
            cell.companyLabel.text = arrayOfCellData[indexPath.row].companyText
            cell.addressLabel.text = arrayOfCellData[indexPath.row].addressText
            cell.phoneNumberLabel.text = arrayOfCellData[indexPath.row].phoneNumberText
            cell.websiteLabel.text = arrayOfCellData[indexPath.row].websiteText
            
            return cell
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    
    }
