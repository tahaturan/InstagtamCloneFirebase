//
//  FeedViewController.swift
//  InstagramCloneFirebase
//
//  Created by Taha Turan on 4.05.2023.
//

import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var userEmailArray = [String]()
    var userCommentArray = [String]()
    var likeArray = [Int]()
    var userImageArray = [String]()
    var documentIdArray = [String]()


    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
        getDataFromFirestore()
    }
    



}

// MARK: TableView Listeleme islemleri
extension FeedViewController: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell" , for: indexPath) as! FeedTableViewCell
        
        cell.commentLabel.text = userCommentArray[indexPath.row]
        cell.userNameLabel.text = userEmailArray[indexPath.row]
        cell.likeLabel.text = String(likeArray[indexPath.row])
        cell.userImageView.sd_setImage(with: URL(string: self.userImageArray[indexPath.row]))
        cell.documentIDLabel.text = documentIdArray[indexPath.row]
        return cell
    }
    
}


// MARK: Firebase verileri cekme
extension FeedViewController{
    
    func getDataFromFirestore()  {
        
        let fireStoreDatabase = Firestore.firestore()
      
        
        fireStoreDatabase.collection("Posts").order(by: "date", descending: true)
            .addSnapshotListener { snapshot, error in
            
            if error != nil{
                print(error?.localizedDescription ?? "error")
            }else{
                if snapshot?.isEmpty != true && snapshot != nil{
                    
                    self.userEmailArray.removeAll()
                    self.userImageArray.removeAll()
                    self.userCommentArray.removeAll()
                    self.likeArray.removeAll()
                    self.documentIdArray.removeAll()
                    
                    for document in  snapshot!.documents {
                        
                        let documentID = document.documentID
                        self.documentIdArray.append(documentID)
                       
                        
                        if let userName = document.get("postedBy") as? String{
                            self.userEmailArray.append(userName)
                        }
                        
                        if let postComment = document.get("postComment") as? String{
                            self.userCommentArray.append(postComment)
                        }
                        
                        if let likes = document.get("likes") as? Int{
                            self.likeArray.append(likes)
                        }
                        if let userImage = document.get("imageUrl") as? String{
                            self.userImageArray.append(userImage)
                        }
                        
                    }
                    
                    self.tableview.reloadData()
                }
                
            }
            
        }
        
    }
    
}
