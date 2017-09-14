////
////  Coupon2TableViewController.swift
////  CampusCash
////
////  Created by Tyler Jordan Cagle on 9/6/17.
////  Copyright © 2017 Hans von Clemm. All rights reserved.
////
//
//import UIKit
//
//class CouponTableViewController: UITableViewController {
//    
//    var companiesTable: CompaniesTableViewController!
//    var arrayOfCellData = [cellData]()
//    
//    override func viewDidLoad() {
//        
//        super.viewDidLoad()
//        backgroundColor()
//        
//        view.backgroundColor = UIColor.white
//        
//        arrayOfCellData = [cellData(cell: 3, companyText: selectCompanyText, addressText: selectAddressText, phoneNumberText: selectPhoneNumberText, websiteText: selectWebsiteText, couponImage: selectCouponImage
//            , companyImage: selectCompanyImage, companyColor: selectCompanyColor, couponImage1: <#UIImage!#>, couponDetails1: <#String!#>)]
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        if indexPath.row == 0 {
//            if arrayOfCellData[indexPath.row].cell == 3 {
//                
//                let cell = Bundle.main.loadNibNamed("TableViewCell3", owner: self, options: nil)?.first as! TableViewCell3
//                
//                cell.mainImageView.image = arrayOfCellData[indexPath.row].companyImage
//                cell.addressLabel.text = arrayOfCellData[indexPath.row].addressText
//                cell.phoneNumberLabel.text = arrayOfCellData[indexPath.row].phoneNumberText
//                cell.websiteLabel.text = arrayOfCellData[indexPath.row].websiteText
//                
//                let tap = UITapGestureRecognizer(target: self, action: #selector(self.onClicLabel(sender:)))
//                cell.websiteLabel.isUserInteractionEnabled = true
//                cell.websiteLabel.addGestureRecognizer(tap)
//                cell.backgroundColor = UIColor.clear
//                
//                return cell
//                
//            } else {
//                
//                let cell = Bundle.main.loadNibNamed("TableViewCell3", owner: self, options: nil)?.first as! TableViewCell3
//                
//                cell.mainImageView.image = arrayOfCellData[indexPath.row].companyImage
//                cell.addressLabel.text = arrayOfCellData[indexPath.row].addressText
//                cell.phoneNumberLabel.text = arrayOfCellData[indexPath.row].phoneNumberText
//                cell.websiteLabel.text = arrayOfCellData[indexPath.row].websiteText
//                
//                cell.backgroundColor = UIColor.clear
//                
//                return cell
//                
//            }
//        } else {
//            if arrayOfCellData[indexPath.row].cell == 3 {
//                
//                let cell = Bundle.main.loadNibNamed("TableViewCell3", owner: self, options: nil)?.first as! TableViewCell3
//                
//                cell.mainImageView.image = arrayOfCellData[indexPath.row].companyImage
//                cell.addressLabel.text = arrayOfCellData[indexPath.row].addressText
//                cell.phoneNumberLabel.text = arrayOfCellData[indexPath.row].phoneNumberText
//                cell.websiteLabel.text = arrayOfCellData[indexPath.row].websiteText
//                
//                let tap = UITapGestureRecognizer(target: self, action: #selector(self.onClicLabel(sender:)))
//                cell.websiteLabel.isUserInteractionEnabled = true
//                cell.websiteLabel.addGestureRecognizer(tap)
//                cell.backgroundColor = UIColor.clear
//                
//                return cell
//                
//            } else {
//                
//                let cell = Bundle.main.loadNibNamed("TableViewCell3", owner: self, options: nil)?.first as! TableViewCell3
//                
//                cell.mainImageView.image = arrayOfCellData[indexPath.row].companyImage
//                cell.addressLabel.text = arrayOfCellData[indexPath.row].addressText
//                cell.phoneNumberLabel.text = arrayOfCellData[indexPath.row].phoneNumberText
//                cell.websiteLabel.text = arrayOfCellData[indexPath.row].websiteText
//                
//                cell.backgroundColor = UIColor.clear
//                
//                return cell
//                
//            }
//        }
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 244
//    }
//    
//    func onClicLabel(sender:UITapGestureRecognizer) {
//        let string = "http://www."
//        let url =  string + selectWebsiteText
//        openUrl(urlString: url)
//    }
//    
//    func backgroundColor() {
//        
//        if selectCompanyColor == "blue" {
//            let background = CAGradientLayer().blueColor()
//            background.frame = self.view.bounds
//            self.view.layer.insertSublayer(background, at: 0)
//            
//        } else if selectCompanyColor == "red" {
//            let background = CAGradientLayer().redColor()
//            background.frame = self.view.bounds
//            self.view.layer.insertSublayer(background, at: 0)
//            
//        } else if selectCompanyColor == "grey" {
//            let background = CAGradientLayer().greyColor()
//            background.frame = self.view.bounds
//            self.view.layer.insertSublayer(background, at: 0)
//            
//        } else {
//            let background = CAGradientLayer().greyColor()
//            background.frame = self.view.bounds
//            self.view.layer.insertSublayer(background, at: 0)
//            
//        }
//        
//    }
//    
//    
//    func openUrl(urlString:String!) {
//        let url = URL(string: urlString)!
//        if #available(iOS 10.0, *) {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        } else {
//            UIApplication.shared.openURL(url)
//        }
//    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.cellForRow(at: indexPath)?.selectionStyle = UITableViewCellSelectionStyle.none
//    }
//    
//}
