//
//  TabViewController.swift
//  CampusCash
//
//  Created by Tyler Jordan Cagle on 8/10/17.
//  Copyright © 2017 Hans von Clemm. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {
    
    var advertisementBanner1: UIView!
    var advertisementBanner2: UIView!
    var advertisementBanner3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        createBanner()
    }
    
    func createBanner() {
        advertisementBanner1 = UIView(frame: CGRect(x: 0, y: self.view.frame.height - 99, width: self.view.frame.width, height: 50))
        advertisementBanner1.backgroundColor = UIColor.blue
        advertisementBanner1.layer.borderWidth = 2
        advertisementBanner1.layer.borderColor = UIColor.white.cgColor
        view.addSubview(advertisementBanner1)
        
        advertisementBanner2 = UIView(frame: CGRect(x: self.view.frame.width, y: self.view.frame.height - 99, width: self.view.frame.width, height: 50))
        advertisementBanner2.backgroundColor = UIColor.green
        advertisementBanner2.layer.borderWidth = 2
        advertisementBanner2.layer.borderColor = UIColor.white.cgColor
        view.addSubview(advertisementBanner2)
        
        advertisementBanner3 = UIView(frame: CGRect(x: self.view.frame.width, y: self.view.frame.height - 99, width: self.view.frame.width, height: 50))
        advertisementBanner3.backgroundColor = UIColor.red
        advertisementBanner3.layer.borderWidth = 2
        advertisementBanner3.layer.borderColor = UIColor.white.cgColor
        view.addSubview(advertisementBanner3)
        
        let advertisementLabel1 = UILabel(frame: CGRect(x: 0, y: 0, width: advertisementBanner1.frame.width, height: advertisementBanner1.frame.height))
        advertisementLabel1.center = CGPoint(x: advertisementBanner1.frame.width/2, y: advertisementBanner1.frame.height/2)
        advertisementLabel1.text = "Insert Company Advertisements Here"
        advertisementLabel1.textAlignment = .center
        advertisementLabel1.textColor = UIColor.white
        advertisementBanner1.addSubview(advertisementLabel1)
        
        let advertisementLabel2 = UILabel(frame: CGRect(x: 0, y: 0, width: advertisementBanner2.frame.width, height: advertisementBanner2.frame.height))
        advertisementLabel2.center = CGPoint(x: advertisementBanner2.frame.width/2, y: advertisementBanner2.frame.height/2)
        advertisementLabel2.text = "Heres Another Company Advertisement"
        advertisementLabel2.textAlignment = .center
        advertisementLabel2.textColor = UIColor.white
        advertisementBanner2.addSubview(advertisementLabel2)
        
        let advertisementLabel3 = UILabel(frame: CGRect(x: 0, y: 0, width: advertisementBanner3.frame.width, height: advertisementBanner3.frame.height))
        advertisementLabel3.center = CGPoint(x: advertisementBanner3.frame.width/2, y: advertisementBanner3.frame.height/2)
        advertisementLabel3.text = "And One More Company Advertisement"
        advertisementLabel3.textAlignment = .center
        advertisementLabel3.textColor = UIColor.white
        advertisementBanner3.addSubview(advertisementLabel3)
        
        animateBanner()
    }
    
    @objc func  animateBanner() {
        UIView.animate(withDuration: 0.5, delay: 15, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.advertisementBanner2.center = self.advertisementBanner1.center
            self.advertisementBanner1.center = self.advertisementBanner3.center
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 30, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.advertisementBanner3.center = self.advertisementBanner2.center
            self.advertisementBanner2.center = self.advertisementBanner1.center
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 45, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.advertisementBanner1.center = self.advertisementBanner3.center
            self.advertisementBanner3.center = self.advertisementBanner2.center
        }, completion: nil)
        Timer.scheduledTimer(timeInterval: 45, target: self, selector: #selector(animateBanner), userInfo: nil, repeats: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

