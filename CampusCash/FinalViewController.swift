//
//  FinalViewController.swift
//  CampusCash
//
//  Created by Tyler Jordan Cagle on 9/20/17.
//  Copyright © 2017 Hans von Clemm. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {

    @IBOutlet weak var finalCouponImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let finalImage: UIImage = decideCoupon
        finalCouponImage.image = finalImage
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
