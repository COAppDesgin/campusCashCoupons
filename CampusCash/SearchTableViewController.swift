//
//  SearchTableViewController.swift
//  CampusCash
//
//  Created by Tyler Jordan Cagle on 8/10/17.
//  Copyright © 2017 Hans von Clemm. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {

    lazy var searchBar:UISearchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSearchBar()
    }

    func setupSearchBar() {
        searchBar.searchBarStyle = UISearchBarStyle.prominent
        searchBar.placeholder = " Search.."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        navigationItem.titleView = searchBar

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToVC2", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
