//
//  UserTableViewController.swift
//  tableviewx2
//
//  Created by Skyler Hope on 3/1/23.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    var inclusionParameters = ""
    var amountOfPeople: String = ""
    var users: [User] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Don't ever register cells!
        // Only need to register a cell if it's created outside of your storyboard file.
//        self.tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "userCell")
        makeNetworkCall()
    }
    
    func makeNetworkCall() {
        let url = URL(string: "https://randomuser.me/api/?results=\(amountOfPeople)&inc=\(inclusionParameters)&format=pretty")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(RandomUserResponse.self, from: data)
                print("response", response.results.count)
                self.users = response.results
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }


                print("utvc.users", self.users.count)
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }.resume()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("users after", users.count)
        return users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
//        cell.awakeFromNib()
        cell.indexPath = indexPath
        let user = users[indexPath.row]
        cell.configure(with: user)
            
        return cell
    }

}
