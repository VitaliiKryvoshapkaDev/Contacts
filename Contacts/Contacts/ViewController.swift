//
//  ViewController.swift
//  Contacts
//
//  Created by Vitalii Kryvoshapka on 09.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}


//MARK: - Protocols -

//MARK: - Extensions -

extension ViewController: UITableViewDataSource{
    //Return all rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    //Configure cell
    private func configure(cell: inout UITableViewCell, for indexPath: IndexPath){
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "Row \(indexPath.row)"
        cell.contentConfiguration = configuration
    }
    
    
    //Return exempliar cell for need row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Exempliar of cell (try download reusable cell
        var cell: UITableViewCell
        
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "MyCell") {
            print("Wse old cell for row with index \(indexPath.row)")
            
            cell = reuseCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
        }
        configure(cell: &cell, for: indexPath)
        return cell
    }
}
