//
//  UserTableViewController.swift
//  tableviewx2
//
//  Created by Skyler Hope on 3/1/23.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    static var amountOfPeople: Int = 1
    
    static var users: [User] = []
    
    static var addressBool: Bool = true
    static var emailBool: Bool = true
    static var createdBool: Bool = true
    static var balanceBool: Bool = true
    static var currentViewController: UserTableViewController?
    
    deinit {
        Self.currentViewController = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Self.currentViewController = self
        // Don't ever register cells!
        // Only need to register a cell if it's created outside of your storyboard file.
//        self.tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "userCell")

        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("users after", UserTableViewController.users.count)
        return UserTableViewController.users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
//        cell.awakeFromNib()
        cell.indexPath = indexPath
        let user = UserTableViewController.users[indexPath.row]
        cell.configure(with: user)
            
        return cell
    }

}
