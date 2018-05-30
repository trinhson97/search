//
//  TableViewController.swift
//  Seark
//
//  Created by Son on 5/23/18.
//  Copyright © 2018 Son. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController,UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    var big0Team = ["dat","hoang","son","luyen","ngoc a"]
    var big0 = [String]()
    var isActive : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        big0 = big0Team

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isActive {
            return big0.count
            
        }else{
            return big0Team.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        if isActive {
            cell.textLabel?.text = big0[indexPath.row]
        }else{
            cell.textLabel?.text = big0Team[indexPath.row]
            
        }
        return cell
    }
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        big0 = searchText.isEmpty ? big0Team : big0Team.filter {(item : String) -> Bool in
             item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
    }
    tableView.reloadData()

}
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isActive = false
    }
}
