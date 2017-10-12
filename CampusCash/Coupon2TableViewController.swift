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

var decideCoupon: UIImage!

class Coupon2TableViewController: UITableViewController {
    
    @IBAction func unwindToC2T(segue:UIStoryboardSegue) { }
    
    var arrayOfCompanyData = [companyData]()
    var arrayOfCouponData = [couponData]()
    var redeemCoupon: UIButton!
    var tab = UITabBarController()
    
    let selectFinalImage1 = #imageLiteral(resourceName: "$2Off")
    let selectFinalImage2 = #imageLiteral(resourceName: "$3Off")
    let selectFinalImage3 = #imageLiteral(resourceName: "$10.49TwoSubs")
    let selectFinalImage4 = selectCouponImage
    let selectFinalImage5 = selectCouponImage
    let selectFinalImage6 = selectCouponImage
    let selectFinalImage7 = selectCouponImage
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        arrayOfCompanyData = [companyData(cell: 0, addressText: selectAddressText, phoneNumberText: selectPhoneNumberText, websiteText: selectWebsiteText, companyImage: selectCompanyImage, companyColor: selectCompanyColor)]
        arrayOfCouponData = [couponData(cell: 0, couponImage: selectCouponImage, foodImage: #imageLiteral(resourceName: "Corner4"), couponDetails: "DO NOT USE LEAVE AS A BLANK!DO NOT USE LEAVE AS A BLANK!DO NOT USE LEAVE AS A BLANK!DO NOT USE LEAVE AS A BLANK"),
                             couponData(cell: 1, couponImage: selectCouponImage, foodImage: #imageLiteral(resourceName: "Corner1"), couponDetails: "This will be exactly one sentence."),
                             couponData(cell: 2, couponImage: selectCouponImage, foodImage: #imageLiteral(resourceName: "Corner2"), couponDetails: "This will be exactly one sentence. This will be exactly two sentences."),
                             couponData(cell: 3, couponImage: selectCouponImage, foodImage: #imageLiteral(resourceName: "Corner4"), couponDetails: "This will be exactly one sentence. This will be exactly two sentences. This will be exactly 3 sentences."),
                             couponData(cell: 4, couponImage: selectCouponImage, foodImage: #imageLiteral(resourceName: "Corner3"), couponDetails: "This will be exactly one sentence. This will be exactly two sentences. This will be exactly 3 sentences. This will be exactly four sentences."),
                             couponData(cell: 5, couponImage: selectCouponImage, foodImage: #imageLiteral(resourceName: "Corner2"), couponDetails: "This will be exactly one sentence. This will be exactly two sentences. This will be exactly 3 sentences. This will be exactly four sentences. This will be exactly five sentences."),
                             couponData(cell: 6, couponImage: selectCouponImage, foodImage: #imageLiteral(resourceName: "Corner4"), couponDetails: "Details about the coupon"),
                             couponData(cell: 7, couponImage: selectCouponImage, foodImage: #imageLiteral(resourceName: "Corner3"), couponDetails: "Details about the coupon")]
        
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "myArrayKey") as? [couponData] else {
            return
        }
        arrayOfCouponData = data
        tableView.reloadData()
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
            
            redeemCoupon = cell.redeemCoupon
            redeemCoupon.layer.cornerRadius = 9
            redeemCoupon.layer.borderColor = UIColor.black.cgColor
            redeemCoupon.layer.borderWidth = 1
            redeemCoupon.tag = arrayOfCouponData[indexPath.row].cell
            
            redeemCoupon.addTarget(Any.self, action: #selector(sendAlready), for: .touchUpInside)
            
            cell.couponDetails.sizeToFit()
            
            return cell
        }
    }
    
    func onClicLabel(sender:UITapGestureRecognizer) {
        let string = "http://www."
        let url =  string + selectWebsiteText
        openUrl(urlString: url)
    }
    
//    func hideTableRow(redeemCell: Int!) {
//        let indexPath = IndexPath()
//        let myCell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell4",for: indexPath)
//        
//        if indexPath.row == redeemCell {
//            myCell.isHidden = true
//        } else {
//            myCell.isHidden = false
//        }
//    }
    
    func backgroundColor() {

        if selectCompanyColor == "blue" {
            let background = CAGradientLayer().blueColor()
            background.frame = CGRect(x: 0, y: 0, width: 414, height: 400 * arrayOfCouponData.count)
            self.view.layer.insertSublayer(background, at: 0)
            
            let blurEffect = UIBlurEffect(style: .extraLight)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = CGRect(x: 0, y: 0, width: 414, height: 400 * arrayOfCouponData.count)
            self.view.insertSubview(blurEffectView, at: 0)

        } else if selectCompanyColor == "red" {
            let background = CAGradientLayer().redColor()
            background.frame = CGRect(x: 0, y: 0, width: 414, height: 400 * arrayOfCouponData.count)
            self.view.layer.insertSublayer(background, at: 0)
            
            let blurEffect = UIBlurEffect(style: .extraLight)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = CGRect(x: 0, y: 0, width: 414, height: 400 * arrayOfCouponData.count)
            self.view.insertSubview(blurEffectView, at: 0)

        } else if selectCompanyColor == "grey" {
            let background = CAGradientLayer().greyColor()
            background.frame = CGRect(x: 0, y: 0, width: 414, height: 400 * arrayOfCouponData.count)
            self.view.layer.insertSublayer(background, at: 0)
            
            let blurEffect = UIBlurEffect(style: .extraLight)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = CGRect(x: 0, y: 0, width: 414, height: 400 * arrayOfCouponData.count)
            self.view.insertSubview(blurEffectView, at: 0)

        } else {
            let background = CAGradientLayer().greyColor()
            background.frame = CGRect(x: 0, y: 0, width: 414, height: 400 * arrayOfCouponData.count)
            self.view.layer.insertSublayer(background, at: 0)

        }
    }
    
    func sendRedeem(redeemCell: Int!) {
        
        if redeemCell == 1 {
            decideCoupon = selectFinalImage1
        }else if redeemCell == 2 {
            decideCoupon = selectFinalImage2
        }else if redeemCell == 3 {
            decideCoupon = selectFinalImage3
        }else if redeemCell == 4 {
            decideCoupon = selectFinalImage4
        }else if redeemCell == 5 {
            decideCoupon = selectFinalImage5
        }else if redeemCell == 6 {
            decideCoupon = selectFinalImage6
        }else if redeemCell == 7 {
            decideCoupon = selectFinalImage7
        }else {
            decideCoupon = selectFinalImage1
        }
    }
    
    func sendAlready() {
        let alert = UIAlertController(title: "Redeem Coupon?", message: "This coupon will be removed after the redeem button has been pressed!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
            self.performSegue(withIdentifier: "couponSegue", sender: self)
        }))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func goBackToOneButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToC2T", sender: self)
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
}
