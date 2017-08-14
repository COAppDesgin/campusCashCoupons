//
//  TabViewController.swift
//  CampusCash
//
//  Created by Tyler Jordan Cagle on 8/10/17.
//  Copyright © 2017 Hans von Clemm. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
