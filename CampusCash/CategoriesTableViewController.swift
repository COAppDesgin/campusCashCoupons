//
//  CategoriesTableViewController.swift
//  
//
//  Created by Tyler Jordan Cagle on 8/10/17.
//
//

import UIKit

struct categoriesData {
    
    let cell: Int!
    let categoriesImage: UIImage!
    let categoriesLabel: String!
}

class CategoriesTableViewController: UITableViewController {

    var arrayOfCategoriesData = [categoriesData]()
    lazy var searchBar:UISearchBar = UISearchBar()
//    let categories = ["Automotive", "Books", "Food", "Health", "Hotels", "Miscellaneous", "Retail", "Salons", "Services", "Tanning"]
    var index: Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfCategoriesData = [categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Automotive"), categoriesLabel: "Automotive"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Books"), categoriesLabel: "Books"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Food"), categoriesLabel: "Food"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Health"), categoriesLabel: "Health"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Hotels"), categoriesLabel: "Hotels"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Miscellaneous"), categoriesLabel: "Miscellaneous"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Retail"), categoriesLabel: "Retail"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Salons"), categoriesLabel: "Salons"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Services"), categoriesLabel: "Services"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Tanning"), categoriesLabel: "Tanning")]
        
        setupSearchBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCategoriesData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if arrayOfCategoriesData[indexPath.row].cell == 2 {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
            
            cell.mainImageView.image = arrayOfCategoriesData[indexPath.row].categoriesImage
            cell.categoriesLabel.text = arrayOfCategoriesData[indexPath.row].categoriesLabel
            
            return cell
            
        } else {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
            
            cell.mainImageView.image = arrayOfCategoriesData[indexPath.row].categoriesImage
            cell.categoriesLabel.text = arrayOfCategoriesData[indexPath.row].categoriesLabel
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        print(index)
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CompaniesTableViewController") as? CompaniesTableViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
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
