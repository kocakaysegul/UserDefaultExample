//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Ayşegül Koçak on 21.02.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birth")
        
        if let newName = storedName as? String {
            nameLabel.text = newName
        }
        
        if let newBirth = storedBirthday as? String {
            birthdayLabel.text = newBirth
        }
        
    }

    @IBAction func saveButtonClicked(_ sender: Any) {
        
        nameLabel.text = "name : \(nameTextField.text!)"
        birthdayLabel.text = "Bthday : \(birthdayTextField.text!)"
        
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text, forKey: "birth")
        //UserDefaults.standard.synchronize() //we dont have to use it anymore
        
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birth")
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "name"
        }
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birth")
            birthdayLabel.text = "birthday"
            
        }
        
    }
    
    
    
    
}

