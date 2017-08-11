//
//  ViewController.swift
//  CampusCash
//
//  Created by Hans von Clemm on 8/8/17.
//  Copyright © 2017 Hans von Clemm. All rights reserved.
//

import UIKit
import PureLayout

class ViewController: UIViewController {
    
    let searchController = SearchTableViewController()
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    @IBAction func unwindToVC2(segue:UIStoryboardSegue) { }
    
    var pageControl: UIPageControl!
    var scrollView: UIScrollView!
    var imageArray = [UIImage]()
    var selectCity: UILabel!
    
    var searchButton: UIButton!
    let searchButtonStartingCornerRadius: CGFloat = 20
    let searchButtonEndingCornerRadius: CGFloat = 0
    let searchButtonEndingAlpha: CGFloat = 0
    let searchButtonStartingAlpha: CGFloat = 1

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()
        configurePageControl()
        setupBottomBar()
        setupSearchButton()
        addSelectCityLabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: view.frame.width/2 - 100, y: view.frame.height/2 + 135, width: 200, height: 20))
        scrollView = UIScrollView(frame: CGRect(x: 0, y: self.view.frame.height/2 + 50, width: self.view.frame.width, height: self.view.frame.height/2))
        //        scrollView.delegate = self as? UIScrollViewDelegate
        scrollView.isUserInteractionEnabled = true
        view.addSubview(scrollView)
        
        imageArray = [UIImage(named: "logoBottomCU")!, UIImage(named: "logoBottomCU")!, UIImage(named:"logoBottomCSU")!]
        
        for i in 0..<imageArray.count {
            
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 55, width: self.scrollView.frame.width, height: self.scrollView.frame.height - 100)
            
            scrollView.contentSize.width = scrollView.frame.width * CGFloat(i + 1)
            scrollView.addSubview(imageView)
        }
        
        pageControl.numberOfPages = imageArray.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.black
        pageControl.currentPageIndicatorTintColor = UIColor.green
        view.addSubview(pageControl)
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let scrollView = UIScrollView(frame: CGRect(x:0, y:0, width:320, height: 300))
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        
        pageControl.currentPage = Int(pageNumber)
    }
    
    func setupBottomBar() {
        let bottomBarImage: UIButton!
        let image = UIImage(named: "bottomBar")
        bottomBarImage = UIButton(type: .custom)
        bottomBarImage.setBackgroundImage(image, for: .normal)
        bottomBarImage.translatesAutoresizingMaskIntoConstraints = false
        bottomBarImage.isUserInteractionEnabled = true
        bottomBarImage.adjustsImageWhenHighlighted = false
        bottomBarImage.alpha = 0.9
        //bottomBarImage.addTarget(self, action: #selector(sendBottomBar), for: .touchDragInside)
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(sendBottomBar))
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeGestureRecognizer)
        
        //bottomBarImage.frame = CGRect(x: 0 y: 0, width: 100, height: 200)
        view.addSubview(bottomBarImage)
        view.bringSubview(toFront: bottomBarImage)
        
        bottomBarImage.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        bottomBarImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        bottomBarImage.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        bottomBarImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func sendBottomBar() {
        
        self.performSegue(withIdentifier: "firstSegue", sender: self)
    }
    
    func setupImageView() {
        let imageTop = UIImage(named: "logoTopCU")
        let logoImageTop = UIImageView(image: imageTop)
        logoImageTop.frame = CGRect(x: 2, y: 25, width: self.view.frame.width - 3, height: 443)
        view.addSubview(logoImageTop)
        
        //        let imageBottom = UIImage(named: "logoBottomCSU")
        //        let logoImageBottom = UIImageView(image: imageBottom)
        //        logoImageBottom.frame = CGRect(x: 0, y: 450, width: self.view.frame.width, height: 235)
        //        view.addSubview(logoImageBottom)
        //        view.sendSubview(toBack: logoImageBottom)
    }
    
    func setupSearchButton() {
        searchButton = UIButton(type: .custom)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.addTarget(self, action: #selector(searchClicked), for: .touchUpInside)
        searchButton.setTitle("Search..", for: .normal)
        searchButton.backgroundColor = UIColor.init(red: 72/255, green: 69/255, blue: 55/255, alpha: 1)
        searchButton.layer.cornerRadius = searchButtonStartingCornerRadius
        searchButton.isHighlighted = true
        view.addSubview(searchButton)
        
        searchButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        searchButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -350).isActive = true
        searchButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -32).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func searchClicked(sender: UIButton!) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "SearchTableViewController") as! UITableViewController
        let navController = UINavigationController(rootViewController: vc)
        self.present(navController, animated: true, completion: nil)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange textSearched: String) {
        
    }

    func addSelectCityLabel() {
        let selectCity = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        selectCity.text = "Select your city below:"
        selectCity.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2 + 125)
        selectCity.textColor = UIColor.blue
        selectCity.textAlignment = .center
        
        view.addSubview(selectCity)

    }
    
}


