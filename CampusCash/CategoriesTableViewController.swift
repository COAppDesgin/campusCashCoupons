//
//  CategoriesTableViewController.swift
//  
//
//  Created by Tyler Jordan Cagle on 8/10/17.
//
//

import UIKit

class CategoriesTableViewController: UIViewController, UITableViewDelegate {

    lazy var searchBar:UISearchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func searchBar(searchBar: UISearchBar, textDidChange textSearched: String) {
    
    }
    
}
