//
//  ViewController.swift
//  InstagramCloneFirebase
//
//  Created by Taha Turan on 4.05.2023.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        
    }

    
 
    @IBAction func signInButton(_ sender: Any) {
        userControl()
    }
    
    
    @IBAction func signUpButton(_ sender: Any) {
    }
    
    
}


// MARK: Giris islemi kontrol

extension ViewController{
    
    func userControl()  {
        if emailTextField.text != "" && passwordTextField.text != ""{
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { authData, error in
                
                if error != nil{
                    self.makeAlert(alertTitle: "Error!", alertMessage: error?.localizedDescription ?? "Error")
                }else{
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    
                }
                
            }
            
            
        }else{
            self.makeAlert(alertTitle: "Error!", alertMessage: "UserName/Password empty")
            
        }
    }
    
    
    func makeAlert(alertTitle:String , alertMessage:String)  {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okButton)
        
        self.present(alert, animated: true)
    }
    
}
