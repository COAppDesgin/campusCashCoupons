//
//  CouponTableViewController.swift
//  CampusCash
//
//  Created by Tyler Jordan Cagle on 8/14/17.
//  Copyright © 2017 Hans von Clemm. All rights reserved.
//

import UIKit

class CouponTableViewController: UITableViewController {
    
    var companiesTable: CompaniesTableViewController!
    var arrayOfCellData = [cellData]()
    
//    var selectCompanyText: String!
//    var selectAddressText: String!
//    var selectPhoneNumberText: String!
//    var selectWebsiteText: String!
//    var selectCouponImage: UIImageView!
//    var index: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
         arrayOfCellData = [cellData(cell: 3, companyText: selectCompanyText, addressText: selectAddressText, phoneNumberText: selectPhoneNumberText, websiteText: selectWebsiteText, couponImage: selectCouponImage)]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if arrayOfCellData[indexPath.row].cell == 3 {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell3", owner: self, options: nil)?.first as! TableViewCell3
            
            cell.mainImageView.image = arrayOfCellData[indexPath.row].couponImage
            cell.companyLabel.text = arrayOfCellData[indexPath.row].companyText
            cell.addressLabel.text = arrayOfCellData[indexPath.row].addressText
            cell.phoneNumberLabel.text = arrayOfCellData[indexPath.row].phoneNumberText
            cell.websiteLabel.text = arrayOfCellData[indexPath.row].websiteText
            
            return cell
            
        } else {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell3", owner: self, options: nil)?.first as! TableViewCell3
            
            cell.mainImageView.image = arrayOfCellData[indexPath.row].couponImage
            cell.companyLabel.text = arrayOfCellData[indexPath.row].companyText
            cell.addressLabel.text = arrayOfCellData[indexPath.row].addressText
            cell.phoneNumberLabel.text = arrayOfCellData[indexPath.row].phoneNumberText
            cell.websiteLabel.text = arrayOfCellData[indexPath.row].websiteText
            
            return cell
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
    }

}
