//
//  Coupon2TableViewController.swift
//  CampusCash
//
//  Created by Tyler Jordan Cagle on 9/6/17.
//  Copyright © 2017 Hans von Clemm. All rights reserved.
//

import UIKit

struct companyData {
    
    let cell: Int!
    let addressText: String!
    let phoneNumberText: String!
    let websiteText: String!
    let companyImage: UIImage!
    let companyColor: String!
    
}

struct couponData {
    
    let cell: Int!
    let couponImage: UIImage!
    let foodImage: UIImage!
    let couponDetails: String!
    
}

class Coupon2TableViewController: UITableViewController {
    
    var arrayOfCompanyData = [companyData]()
    var arrayOfCouponData = [couponData]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        arrayOfCompanyData = [companyData(cell: 1, addressText: selectAddressText, phoneNumberText: selectPhoneNumberText, websiteText: selectWebsiteText, companyImage: selectCompanyImage, companyColor: selectCompanyColor)]
        arrayOfCouponData = [couponData(cell: 2, couponImage: selectCouponImage, foodImage: #imageLiteral(resourceName: "Corner4"), couponDetails: "DO NOT USE LEAVE AS A BLANK!DO NOT USE LEAVE AS A BLANK!DO NOT USE LEAVE AS A BLANK!DO NOT USE LEAVE AS A BLANK"),
                             couponData(cell: 2, couponImage: selectCouponImage, foodImage: #imageLiteral(resourceName: "Corner1"), couponDetails: "Buy one get 500% off every day for the rest of your life you god damn beautiful monster you!"),
                             couponData(cell: 2, couponImage: selectCouponImage, foodImage: #imageLiteral(resourceName: "Corner2"), couponDetails: "Buy one get 500% off every day for the rest of your life you god damn beautiful monster you!"),
                             couponData(cell: 2, couponImage: selectCouponImage, foodImage: #imageLiteral(resourceName: "Corner4"), couponDetails: "Buy one get 500% off every day for the rest of your life you god damn beautiful monster you!"),
                             couponData(cell: 2, couponImage: selectCouponImage, foodImage: #imageLiteral(resourceName: "Corner3"), couponDetails: "Details about the coupon"),
                             couponData(cell: 2, couponImage: selectCouponImage, foodImage: #imageLiteral(resourceName: "Corner2"), couponDetails: "Details about the coupon"),
                             couponData(cell: 2, couponImage: selectCouponImage, foodImage: #imageLiteral(resourceName: "Corner4"), couponDetails: "Details about the coupon"),
                             couponData(cell: 2, couponImage: selectCouponImage, foodImage: #imageLiteral(resourceName: "Corner3"), couponDetails: "Details about the coupon")]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCouponData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell3", owner: self, options: nil)?.first as! TableViewCell3
            
            cell.mainImageView.image = arrayOfCompanyData[indexPath.row].companyImage
            cell.addressLabel.text = arrayOfCompanyData[indexPath.row].addressText
            cell.phoneNumberLabel.text = arrayOfCompanyData[indexPath.row].phoneNumberText
            cell.websiteLabel.text = arrayOfCompanyData[indexPath.row].websiteText
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.onClicLabel(sender:)))
            cell.websiteLabel.isUserInteractionEnabled = true
            cell.websiteLabel.addGestureRecognizer(tap)
            cell.backgroundColor = UIColor.clear
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell
            
        } else {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell4", owner: self, options: nil)?.first as! TableViewCell4
            
            cell.foodImage.image = arrayOfCouponData[indexPath.row].foodImage
            cell.couponDetails.text = arrayOfCouponData[indexPath.row].couponDetails
            
            backgroundColor()
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            cell.couponDetails.lineBreakMode = NSLineBreakMode.byWordWrapping
            cell.couponDetails.numberOfLines = 0
            
            return cell
            
        }

        
    }
    
    func onClicLabel(sender:UITapGestureRecognizer) {
        let string = "http://www."
        let url =  string + selectWebsiteText
        openUrl(urlString: url)
    }

    func backgroundColor() {

        if selectCompanyColor == "blue" {
            let background = CAGradientLayer().blueColor()
            background.frame = CGRect(x: 0, y: 0, width: 414, height: 400 * arrayOfCouponData.count)
            self.view.layer.insertSublayer(background, at: 0)

        } else if selectCompanyColor == "red" {
            let background = CAGradientLayer().redColor()
            background.frame = CGRect(x: 0, y: 0, width: 414, height: 400 * arrayOfCouponData.count)
            self.view.layer.insertSublayer(background, at: 0)

        } else if selectCompanyColor == "grey" {
            let background = CAGradientLayer().greyColor()
            background.frame = CGRect(x: 0, y: 0, width: 414, height: 400 * arrayOfCouponData.count)
            self.view.layer.insertSublayer(background, at: 0)

        } else {
            let background = CAGradientLayer().greyColor()
            background.frame = CGRect(x: 0, y: 0, width: 414, height: 400 * arrayOfCouponData.count)
            self.view.layer.insertSublayer(background, at: 0)

        }

    }


    func openUrl(urlString:String!) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 287
        } else {
            return 366
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
