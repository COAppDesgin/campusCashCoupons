//
//  firstSegue.swift
//  CampusCash
//
//  Created by Allison MacMillan on 8/9/17.
//  Copyright © 2017 Hans von Clemm. All rights reserved.
//

import UIKit

class firstSegue: UIStoryboardSegue {
    
    
    override func perform() {
        
        //assign source and destination views to local variables
        let firstView = self.source.view as UIView!
        let secondView = self.destination.view as UIView!
        
        //get screen's width and height
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        //specify the initial position of the destination view
        secondView?.frame = CGRect.init(x: 0.0, y: screenHeight, width: screenWidth, height: screenHeight)
        
        //access the app's key window and insert the destination view above the current (source) one
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(secondView!, aboveSubview: firstView!)
        
        //animate the transition
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            firstView?.frame = firstView!.frame.offsetBy(dx: 0.0, dy: -screenHeight)
            secondView?.frame = (secondView?.frame.offsetBy(dx: 0.0, dy: -screenHeight))!
            
        }) { (Finished) -> Void in
            self.source.present(self.destination, animated: false, completion: nil)
        }
    }
}
