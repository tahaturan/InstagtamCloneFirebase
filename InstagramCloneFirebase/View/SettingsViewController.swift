//
//  SettingsViewController.swift
//  InstagramCloneFirebase
//
//  Created by Taha Turan on 4.05.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func logoutButton(_ sender: Any) {
        performSegue(withIdentifier: "toSignVC", sender: nil)
    }
    
}
