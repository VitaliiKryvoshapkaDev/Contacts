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
        
        //Load Contacts
        loadContacts()
        
    }
    
    private var contacts = [ContactProtocol]()
    
    private func loadContacts(){
        contacts.append(Contact(title: "Vitalii Kryvoshapka", phone: "+380633276783"))
        contacts.append(Contact(title: "Alissa Mironenko", phone: "+380934141696"))
        contacts.append(Contact(title: "Arthem Novytsky", phone: "+3804853290"))
        
        //Alphabet sort
        contacts.sort{ $0.title < $1.title}
    }
}



//MARK: - Protocols -

//MARK: - Extensions -
//Extension for Data Source
extension ViewController: UITableViewDataSource{
    //Return all rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    //Configure cell
    private func configure(cell: inout UITableViewCell, for indexPath: IndexPath){
        var configuration = cell.defaultContentConfiguration()
        configuration.text = contacts[indexPath.row].title
        configuration.secondaryText = contacts[indexPath.row].phone
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

//Extension for swipe delet (Delegate)

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //Delete action
        let actionDelete = UIContextualAction(style: .destructive, title: "Delete?") { _, _, _ in
            //Delete contact
            self.contacts.remove(at: indexPath.row)
            //Reload tableView
            tableView.reloadData()
        }
        
        // Exempliar  (Avalible Action)
        let actions = UISwipeActionsConfiguration(actions: [actionDelete])
        return actions
    }
    
}
