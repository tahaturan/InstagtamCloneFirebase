//
//  SignUpViewController.swift
//  InstagramCloneFirebase
//
//  Created by Taha Turan on 4.05.2023.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func signUpButton(_ sender: Any) {
        signUpUser()
    }
    


}



// MARK: kayit olma fonksiyonu
extension SignUpViewController{
    
    
    func signUpUser() {
        
        if emailTextField.text != "" && passwordTextField.text != ""{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authData, error in
                
                if error != nil{
   
                    self.showAlert(alertTitle: "ERROR", alertMessage: error?.localizedDescription ?? "Error")
 
                }else{
                    
                    self.performSegue(withIdentifier: "signUpToLogInVC", sender: nil)
                }
            }
            
        }else{
            showAlert(alertTitle: "Error", alertMessage: "UserName/Password empty")
        }
        
      
    }
    
}
// MARK: Alert fonksiyon
extension SignUpViewController{
    
    func showAlert(alertTitle:String , alertMessage:String)  {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okButton)
        
        self.present(alert, animated: true)
    }
    
}
