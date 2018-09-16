//
//  ViewController.swift
//  User Default
//
//  Created by MEHEDI.R8 on 9/16/18.
//  Copyright © 2018 mehedi.r8. All rights reserved.
//

import UIKit

class NameListVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var nameArray = ["Mehedi", "Right", "Apple", "Jio", "Head"]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        if let nam = defaults.array(forKey: "nameList") as? [String] {
            nameArray = nam
        }
    }
    
    @IBAction func addNameBtnPressed(_ sender: Any) {
        var nameTxt = UITextField()
        let alert = UIAlertController(title: "Add Name", message: "Input", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            print("success")
            self.nameArray.append(nameTxt.text!)
            self.defaults.set(self.nameArray, forKey: "nameList")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alerTextField) in
            alerTextField.placeholder = "Enter Name"
            alerTextField.textColor = UIColor.green
            nameTxt = alerTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        cell.textLabel?.textColor = UIColor.red
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(nameArray[indexPath.row])
    
        if tableView.cellForRow(at: indexPath)?.accessoryType != .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

