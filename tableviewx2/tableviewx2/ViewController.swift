//
//  ViewController.swift
//  tableviewx2
//
//  Created by Skyler Hope on 3/1/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var amountOfPeopleSlider: UISlider!
    
    @IBOutlet weak var locationSwitch: UISwitch!
    @IBOutlet weak var emailSwitch: UISwitch!
    @IBOutlet weak var loginSwitch: UISwitch!
    @IBOutlet weak var registeredSwitch: UISwitch!
    
    
    @IBAction func goButtonTapped(_ sender: Any) {
        UserTableViewController.amountOfPeople = Int(amountOfPeopleSlider.value)
        print(Int(amountOfPeopleSlider.value))
        Task {
            fetchUser()
        }
    }
    
    func fetchUser() {
        let results = String(Int(amountOfPeopleSlider.value))
        print(results)
        var inc: String = "name"
        if locationSwitch.isOn == true {
            inc.append(",location")
        }
        if emailSwitch.isOn == true {
            inc.append(",email")
        }
        if loginSwitch.isOn == true {
            inc.append(",login")
        }
        if registeredSwitch.isOn == true {
            inc.append(",registered")
        }
        inc.append(",picture")
        
        let url = URL(string: "https://randomuser.me/api/?results=\(results)&inc=\(inc)&format=pretty")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(RandomUserResponse.self, from: data)
                print("response", response.results.count)
                UserTableViewController.users = response.results
                
                DispatchQueue.main.async {
                    UserTableViewController.currentViewController?.tableView.reloadData()
                }


                print("utvc.users", UserTableViewController.users.count)
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountOfPeopleSlider.value = 15
        amountOfPeopleSlider.minimumValue = 0
        amountOfPeopleSlider.maximumValue = 30
    }
    
}
