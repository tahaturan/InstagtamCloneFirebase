//
//  UploadViewController.swift
//  InstagramCloneFirebase
//
//  Created by Taha Turan on 4.05.2023.
//

import UIKit
import Firebase
import FirebaseStorage

class UploadViewController: UIViewController {
    
    @IBOutlet weak var selectImageView: UIImageView!
    
    @IBOutlet weak var commentTextField: UITextField!
    
    @IBOutlet weak var uploadButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectImageView.isUserInteractionEnabled = true
        let gestureRocognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        selectImageView.addGestureRecognizer(gestureRocognizer)
    }
    

    

    @IBAction func uploadButton(_ sender: Any) {
        uploadImage()
    }
    

}



// MARK: Galeriden resim alma
extension UploadViewController:UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    @objc func chooseImage() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        selectImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
    
}



// MARK: Firebase storage a resim yukleme
extension UploadViewController{
    
    func uploadImage()  {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("media") //klasorun refenrasi
        
        //Resimi Veriye cevirmemiz gerekiyor o sekilde kayit yapicaz
        if let data = selectImageView.image?.jpegData(compressionQuality: 0.5) {
            
            let uuid = UUID().uuidString
            
            let imageReference = mediaFolder.child("\(uuid).jpg")// gorselin referansi
            imageReference.putData(data) { metadata, error in
                
                if error != nil {
                    self.makeAlert(alertTitle: "Error", alertMessage: error?.localizedDescription ?? "Error")
                }else{
                    
                    imageReference.downloadURL { url, error in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                   
                        }
                    }
                    
                }
                
            }
            
        }
    }
    
}
// MARK: Alert
extension UploadViewController{
    
    func makeAlert(alertTitle:String , alertMessage:String)  {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let okeyButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okeyButton)
        self.present(alert, animated: true)
    }
    
}
