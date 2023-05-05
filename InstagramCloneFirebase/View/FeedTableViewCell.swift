//
//  FeedTableViewCell.swift
//  InstagramCloneFirebase
//
//  Created by Taha Turan on 5.05.2023.
//

import UIKit
import Firebase

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var documentIDLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func likeButton(_ sender: Any) {
        likePosts()
    }
    
}


// MARK: Post Begenme
extension FeedTableViewCell{
    
    func likePosts()  {
        
        let fireStoreDatabase = Firestore.firestore()
        
        if let likeCount = Int(likeLabel.text!) {
            
            let likeStore = ["likes" : likeCount+1 ] as [String : Any]
            
            fireStoreDatabase.collection("Posts").document(documentIDLabel.text!).setData(likeStore, merge: true)
        }
        
        
        
        
    }
    
}
