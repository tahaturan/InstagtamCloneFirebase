//
//  SettingsViewController.swift
//  InstagramCloneFirebase
//
//  Created by Taha Turan on 4.05.2023.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func logoutButton(_ sender: Any) {
       userLogout()
    }
    
}

// MARK: Firebase uzerinden cikis yapma
extension SettingsViewController{
    
    func userLogout()  {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "settingsToLogInVC", sender: nil)
        } catch  {
            print(error.localizedDescription)
        }
    }
    
}
