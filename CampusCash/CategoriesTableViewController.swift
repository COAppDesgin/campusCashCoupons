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
    var topBarImage: UIButton!
    
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
        setupTopBar()
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

        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CompaniesTableViewController") as? CompaniesTableViewController {
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
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
        topBarImage.bottomAnchor.constraint(equalTo: self.view.topAnchor, constant: 36).isActive = true
        topBarImage.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        topBarImage.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func sendTopBar() {
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
