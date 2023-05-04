//
//  UploadViewController.swift
//  InstagramCloneFirebase
//
//  Created by Taha Turan on 4.05.2023.
//

import UIKit
import Firebase

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

