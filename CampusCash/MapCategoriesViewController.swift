//
//  MapCategoriesViewController.swift
//  CampusCash
//
//  Created by Tyler Jordan Cagle on 10/18/17.
//  Copyright © 2017 Hans von Clemm. All rights reserved.
//

import UIKit

class MapCategoriesTableViewController: UITableViewController {
    
    var arrayOfCategoriesData = [categoriesData]()
    lazy var searchBar:UISearchBar = UISearchBar()
    //    let categories = ["Automotive", "Books", "Food", "Health", "Hotels", "Miscellaneous", "Retail", "Salons", "Services", "Tanning"]
    var index: Int! = 0
    var topBarImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        
        arrayOfCategoriesData = [categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "zoomLocation"), categoriesLabel: "All"),
                                categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Automotive"), categoriesLabel: "Automotive"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Books"), categoriesLabel: "Books"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Food"), categoriesLabel: "Food"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Health"), categoriesLabel: "Health"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Hotels"), categoriesLabel: "Hotels"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Miscellaneous"), categoriesLabel: "Miscellaneous"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Retail"), categoriesLabel: "Retail"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Salons"), categoriesLabel: "Salons"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Services"), categoriesLabel: "Services"),
                                 categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "Tanning"), categoriesLabel: "Tanning"), categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "nil"), categoriesLabel: ""), categoriesData(cell: 2, categoriesImage: #imageLiteral(resourceName: "nil"), categoriesLabel: "")]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCategoriesData.count
    }
    
    func setupBackground() {
        let background = UIImage(named: "blueFlip")
        let backgroundView = UIImageView(image: background)
        backgroundView.frame = CGRect(x: 0, y: -200, width: Int(self.view.frame.width), height: (300 * (5 + 3)))
        self.tableView.backgroundView = backgroundView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if arrayOfCategoriesData[indexPath.row].cell == 2 {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
            
            cell.mainImageView.image = arrayOfCategoriesData[indexPath.row].categoriesImage
            cell.categoriesLabel.text = arrayOfCategoriesData[indexPath.row].categoriesLabel
            
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell
            
        } else {
            
            let cell = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
            
            cell.mainImageView.image = arrayOfCategoriesData[indexPath.row].categoriesImage
            cell.categoriesLabel.text = arrayOfCategoriesData[indexPath.row].categoriesLabel
            
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            categoriesNumber = 1
            self.performSegue(withIdentifier: "allSegue", sender: self)
        } else if indexPath.row == 1 {
            categoriesNumber = 2
            self.performSegue(withIdentifier: "automotiveSegue", sender: self)
        } else if indexPath.row == 2 {
            categoriesNumber = 3
            self.performSegue(withIdentifier: "booksSegue", sender: self)
        } else if indexPath.row == 3 {
            categoriesNumber = 4
            self.performSegue(withIdentifier: "foodSegue", sender: self)
        } else if indexPath.row == 4 {
            categoriesNumber = 5
            self.performSegue(withIdentifier: "healthSegue", sender: self)
        } else if indexPath.row == 5 {
            categoriesNumber = 6
            self.performSegue(withIdentifier: "hotelsSegue", sender: self)
        } else if indexPath.row == 6 {
            categoriesNumber = 7
            self.performSegue(withIdentifier: "miscellaneousSegue", sender: self)
        } else if indexPath.row == 7 {
            categoriesNumber = 8
            self.performSegue(withIdentifier: "retailSegue", sender: self)
        } else if indexPath.row == 8 {
            categoriesNumber = 9
            self.performSegue(withIdentifier: "salonsSegue", sender: self)
        } else if indexPath.row == 9 {
            categoriesNumber = 10
            self.performSegue(withIdentifier: "servicesSegue", sender: self)
        } else if indexPath.row == 10 {
            categoriesNumber = 11
            self.performSegue(withIdentifier: "tanningSegue", sender: self)
        }
        
        
    }
    
}

