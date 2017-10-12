//
//  TableViewCell4.swift
//  CampusCash
//
//  Created by Tyler Jordan Cagle on 9/12/17.
//  Copyright © 2017 Hans von Clemm. All rights reserved.
//

import UIKit

class TableViewCell4: UITableViewCell {
    

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var redeemCoupon: UIButton!
    @IBOutlet weak var couponDetails: UILabel!
    
    @IBAction func redeemCouponPressed(_ sender: Any) {
        Coupon2TableViewController().sendRedeem(redeemCell: redeemCoupon.tag)
//        Coupon2TableViewController().hideTableRow(redeemCell: redeemCoupon.tag)
    }
}
