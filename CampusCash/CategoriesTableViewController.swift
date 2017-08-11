//
//  CategoriesTableViewController.swift
//  
//
//  Created by Tyler Jordan Cagle on 8/10/17.
//
//

import UIKit

class CategoriesTableViewController: UITableViewController {

    lazy var searchBar:UISearchBar = UISearchBar()
    var cancelButton: UINavigationItem!
    
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

    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
    
    }
    
}