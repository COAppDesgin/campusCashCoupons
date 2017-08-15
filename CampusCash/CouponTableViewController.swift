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
        let width = selectCouponImage.size.width
        let height = selectCouponImage.size.height + 50
        
        if width > height {
            selectCouponImage = imageRotatedByDegrees(oldImage: selectCouponImage, deg: 90)
        } else {
            selectCouponImage = imageRotatedByDegrees(oldImage: selectCouponImage, deg: 0)
        }
        
         arrayOfCellData = [cellData(cell: 3, companyText: selectCompanyText, addressText: selectAddressText, phoneNumberText: selectPhoneNumberText, websiteText: selectWebsiteText, couponImage: selectCouponImage)]
    }
    
    func imageRotatedByDegrees(oldImage: UIImage, deg degrees: CGFloat) -> UIImage {
        //Calculate the size of the rotated view's containing box for our drawing space
        let rotatedViewBox: UIView = UIView(frame: CGRect(x: 0, y: 0, width: oldImage.size.width, height: oldImage.size.height))
        let t: CGAffineTransform = CGAffineTransform(rotationAngle: degrees * CGFloat.pi / 180)
        rotatedViewBox.transform = t
        let rotatedSize: CGSize = rotatedViewBox.frame.size
        //Create the bitmap context
        UIGraphicsBeginImageContext(rotatedSize)
        let bitmap: CGContext = UIGraphicsGetCurrentContext()!
        //Move the origin to the middle of the image so we will rotate and scale around the center.
        bitmap.translateBy(x: rotatedSize.width / 2, y: rotatedSize.height / 2)
        //Rotate the image context
        bitmap.rotate(by: (degrees * CGFloat.pi / 180))
        //Now, draw the rotated/scaled image into the context
        bitmap.scaleBy(x: 1.0, y: -1.0)
        bitmap.draw(oldImage.cgImage!, in: CGRect(x: -oldImage.size.width / 2, y: -oldImage.size.height / 2, width: oldImage.size.width, height: oldImage.size.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
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
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.onClicLabel(sender:)))
            cell.websiteLabel.isUserInteractionEnabled = true
            cell.websiteLabel.addGestureRecognizer(tap)
            
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
    
    func onClicLabel(sender:UITapGestureRecognizer) {
        let string = "http://www."
        let url =  string + selectWebsiteText
        openUrl(urlString: url)
    }
    
    
    func openUrl(urlString:String!) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }

}
