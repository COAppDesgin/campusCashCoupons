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

        setupTopBar()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupTopBar() {
        var topBarImage: UIButton!
        let image = UIImage(named: "topBar")
        topBarImage = UIButton(type: .custom)
        topBarImage.setBackgroundImage(image, for: .normal)
        topBarImage.translatesAutoresizingMaskIntoConstraints = false
        topBarImage.isUserInteractionEnabled = true
        topBarImage.isHighlighted = false
        topBarImage.adjustsImageWhenHighlighted = false
        
        //bottomBarImage.addTarget(self, action: #selector(sendBottomBar), for: .touchDragInside)
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(sendTopBar))
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeGestureRecognizer)
        
        //bottomBarImage.frame = CGRect(x: 0 y: 0, width: 100, height: 200)
        self.view.addSubview(topBarImage)
//        view.sendSubview(toBack: topBarImage)
        
        topBarImage.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        topBarImage.bottomAnchor.constraint(equalTo: self.view.topAnchor, constant: 108).isActive = true
        topBarImage.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        topBarImage.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func sendTopBar() {
        performSegue(withIdentifier: "unwindSegueToVC1", sender: self)
        print("hi")
    }

}
