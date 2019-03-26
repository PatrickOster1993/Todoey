//
//  ViewController.swift
//  Todoey
//
//  Created by Patrick Oster on 23.03.19.
//  Copyright © 2019 Patrick Oster. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let newItem = Item()
        newItem.title = "Save the world!"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Save the world!"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Save the world!"
        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
        
    }
    
    //MARK: - TableView Datasource Methods
    
    // Anzahl der benötigten Zeilen
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
        
    }
    
    // Zeilen der TableView-Cell mit Inhalt füllen (ToDo-Sachen)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK: - Add new Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add new Item to Todoey", message: "", preferredStyle: .alert)
        
        var textField: UITextField = UITextField()
        
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "Creat new item"
            textField = alertTextField
        }
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen if the user clicks the Add Item button on our UIAlert
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
       
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    

}

