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
    let companyImage: UIImage!
    let companyColor: String!
    
}

var selectCompanyText: String!
var selectAddressText: String!
var selectPhoneNumberText: String!
var selectWebsiteText: String!
var selectCouponImage: UIImage!
var selectCompanyImage: UIImage!
var selectCompanyColor: String!

class CompaniesTableViewController: UITableViewController {
    
    var arrayOfCellData = [cellData]()
    var index: Int! = 0
    var tabController: TabViewController?
    
    override func viewDidLoad() {
        
        arrayOfCellData = [cellData(cell: 1, companyText: "Cosmos", addressText: "659 30th St, Boulder", phoneNumberText: "303-447-1133", websiteText: "cosmospizza.com", couponImage: #imageLiteral(resourceName: "Corner4"), companyImage: #imageLiteral(resourceName: "Cosmos Pizza"), companyColor: "grey"),
                           cellData(cell: 1, companyText: "Half Fast Subs", addressText: "1215 13th Street", phoneNumberText: "303-449-0404", websiteText: "halffastsubs.com", couponImage: #imageLiteral(resourceName: "Corner2"), companyImage: #imageLiteral(resourceName: "Half Fast Subs-1"), companyColor: "grey"),
                           cellData(cell: 1, companyText: "The Corner", addressText: "2115 13th Street", phoneNumberText: "720-398-8331", websiteText: "thecornerboulder.com", couponImage: #imageLiteral(resourceName: "Corner1"), companyImage: #imageLiteral(resourceName: "The Corner-1"), companyColor: "grey"), cellData(cell: 2, companyText: "", addressText: "", phoneNumberText: "", websiteText: "", couponImage: #imageLiteral(resourceName: "nil"), companyImage: #imageLiteral(resourceName: "nil"), companyColor: "grey")]
        
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setupBackground()
    }
    
    func setupBackground() {
        let background = UIImage(named: "blueFlip")
        let backgroundView = UIImageView(image: background)
        backgroundView.frame = CGRect(x: 0, y: -200, width: Int(self.view.frame.width), height: (248 * (arrayOfCellData.count + 3)))
        self.tableView.backgroundView = backgroundView
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if arrayOfCellData[indexPath.row].cell == 1 {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell1REWORK", owner: self, options: nil)?.first as! TableViewCell1REWORK
            
            cell.mainImageView.image = arrayOfCellData[indexPath.row].couponImage
            cell.companyLabel.text = arrayOfCellData[indexPath.row].companyText
            cell.companyImageView.image = arrayOfCellData[indexPath.row].companyImage

            cell.mainImageView.layer.borderWidth = 2
            cell.bringSubview(toFront: cell)
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell
            
        } else if arrayOfCellData[indexPath.row].cell == 2 {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
            
            cell.categoriesLabel.text = ""
            cell.mainImageView.image = #imageLiteral(resourceName: "nil")

            cell.bringSubview(toFront: cell)
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell
            
        } else {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell1REWORK", owner: self, options: nil)?.first as! TableViewCell1REWORK
            
            cell.mainImageView.image = arrayOfCellData[indexPath.row].couponImage
            cell.companyLabel.text = arrayOfCellData[indexPath.row].companyText
            cell.companyImageView.image = arrayOfCellData[indexPath.row].companyImage

            cell.mainImageView.layer.borderWidth = 2
            cell.bringSubview(toFront: cell)
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == arrayOfCellData.count - 1 {
            return 50
        } else {
            return 248
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        
        selectCompanyText = arrayOfCellData[index].companyText
        selectAddressText  = arrayOfCellData[index].addressText
        selectPhoneNumberText  = arrayOfCellData[index].phoneNumberText
        selectWebsiteText = arrayOfCellData[index].websiteText
        selectCouponImage = arrayOfCellData[index].couponImage
        selectCompanyImage = arrayOfCellData[index].companyImage
        selectCompanyColor = arrayOfCellData[index].companyColor
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Coupon2TableViewController") as? Coupon2TableViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    
    
}

