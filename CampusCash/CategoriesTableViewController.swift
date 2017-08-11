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
    let categories = ["Automotive", "Books", "Food", "Health", "Hotels", "Miscellaneous", "Retail", "Salons", "Services", "Tanning"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupSearchBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = categories[indexPath.row]
        //let button = UIButton()
        

        
        return cell
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
