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
    
    var inclusionParameters = ""
    var amountOfPeople = "0"
    
    @IBAction func goButtonTapped(_ sender: Any) {
     
        
        saveSettings()
        
    }
    
    func saveSettings() {
        let results = String(Int(amountOfPeopleSlider.value))
        print(results)
        amountOfPeople = results
        
        
        
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
        
        inclusionParameters = inc
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountOfPeopleSlider.value = 15
        amountOfPeopleSlider.minimumValue = 0
        amountOfPeopleSlider.maximumValue = 30
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let userTableViewController = segue.destination as? UserTableViewController {
            userTableViewController.inclusionParameters = inclusionParameters
            userTableViewController.amountOfPeople = amountOfPeople
        }
    }
}
