//
//  ViewController.swift
//  Todoey
//
//  Created by Patrick Oster on 23.03.19.
//  Copyright © 2019 Patrick Oster. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray: [String] = ["Call Tobi!", "Buy Magerquark!", "Hol dir some gains ab!"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //MARK - TableView Datasource Methods
    
    // Anzahl der benötigten Zeilen
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
        
    }
    
    // Zeilen der TableView-Cell mit Inhalt füllen (ToDo-Sachen)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {

             tableView.cellForRow(at: indexPath)?.accessoryType = .none

        }

        else {

            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

}

