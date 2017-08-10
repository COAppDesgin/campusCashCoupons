//
//  ViewController.swift
//  CampusCash
//
//  Created by Hans von Clemm on 8/8/17.
//  Copyright © 2017 Hans von Clemm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func setupBottomBar() {
        var bottomBarImage: UIButton!
        let image = UIImage(named: "bottomBar")
        bottomBarImage = UIButton(type: .custom)
        bottomBarImage.setBackgroundImage(image, for: .normal)
        bottomBarImage.translatesAutoresizingMaskIntoConstraints = false
        bottomBarImage.isUserInteractionEnabled = true
        //bottomBarImage.addTarget(self, action: #selector(sendBottomBar), for: .touchDragInside)
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(sendBottomBar))
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeGestureRecognizer)
        
        //bottomBarImage.frame = CGRect(x: 0 y: 0, width: 100, height: 200)
        self.view.addSubview(bottomBarImage)
        
        bottomBarImage.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        bottomBarImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        bottomBarImage.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        bottomBarImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func sendBottomBar() {
    
        self.performSegue(withIdentifier: "firstSegue", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomBar()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

