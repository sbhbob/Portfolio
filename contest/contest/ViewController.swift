//
//  ViewController.swift
//  contest
//
//  Created by Skyler Hope on 11/29/22
//  Demonstrating Regex and Animations
//

import UIKit

class ViewController: UIViewController {

        // Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
        // Occurs when the submit button is hit.
    @IBAction func submitButtonTapped(_ sender: Any) {
        
            // Makes sure the textfield has data in it
        guard let email = emailTextField.text else { return }
        
            // Calls the regex to make sure the email is valid
        if isValidEmail(email) == true {
            self.performSegue(withIdentifier: "submitSegue", sender: sender)
        }
        else {
            
                // Rotates the textfield if the regex returns false
                // The animations parameter acts as a method
            UITextField.animate(withDuration: 0.5, animations: {
                let rotate = CGAffineTransform(rotationAngle: 50)
                self.emailTextField.transform = rotate
                
                // Returns the textfield to previous state
            }) { (_) in
                UITextField.animate(withDuration: 0.25, animations: {
                    self.emailTextField.transform = CGAffineTransform.identity
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

        // Valid email regex
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

}

