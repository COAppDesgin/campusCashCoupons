//
//  RecentTableViewController.swift
//  CampusCash
//
//  Created by Tyler Jordan Cagle on 11/1/17.
//  Copyright © 2017 Hans von Clemm. All rights reserved.
//

import UIKit

class RecentTableViewController: UITableViewController {

    var topBarImage: UIButton!
    lazy var searchBar:UISearchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupTopBar()
        setupSearchBar()
        
    }
    
    func setupBackground() {
        let background = UIImage(named: "blueFlip")
        let backgroundView = UIImageView(image: background)
        backgroundView.frame = CGRect(x: 0, y: -200, width: Int(self.view.frame.width), height: (300 * (5 + 3)))
        self.tableView.backgroundView = backgroundView
    }
    
    func setupTopBar() {
        let image = UIImage(named: "topBar")
        topBarImage = UIButton(type: .custom)
        topBarImage.setBackgroundImage(image, for: .normal)
        topBarImage.translatesAutoresizingMaskIntoConstraints = false
        topBarImage.isUserInteractionEnabled = true
        topBarImage.isHighlighted = false
        topBarImage.alpha = 0.9
        topBarImage.adjustsImageWhenHighlighted = false
        
        //bottomBarImage.addTarget(self, action: #selector(sendBottomBar), for: .touchDragInside)
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(sendTopBar))
        let touchGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sendTopBar))
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.down
        
        topBarImage.addGestureRecognizer(touchGestureRecognizer)
        self.view.addGestureRecognizer(swipeGestureRecognizer)
        
        //bottomBarImage.frame = CGRect(x: 0 y: 0, width: 100, height: 200)
        self.view.addSubview(topBarImage)
        //        view.sendSubview(toBack: topBarImage)
        
        topBarImage.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        topBarImage.bottomAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        topBarImage.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        topBarImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    @objc func sendTopBar() {
        performSegue(withIdentifier: "unwindSegueToVC1", sender: self)
    }
    
    
    func setupSearchBar() {
        searchBar.searchBarStyle = UISearchBarStyle.prominent
        searchBar.placeholder = " Search.."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        //        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self as? UISearchBarDelegate
        navigationItem.titleView = searchBar
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        
    }
    
}
