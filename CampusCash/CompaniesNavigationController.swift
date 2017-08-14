//
//  CompaniesNavigationController.swift
//  CampusCash
//
//  Created by Tyler Jordan Cagle on 8/14/17.
//  Copyright © 2017 Hans von Clemm. All rights reserved.
//

import UIKit

class CompaniesNavigationController: UINavigationController {

    var tabController: TabViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        tabController?.topBarImage.isEnabled = false
//        tabController?.topBarImage.isHidden = true
//        tabController?.topBarImage.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
