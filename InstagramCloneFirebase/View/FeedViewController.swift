//
//  FeedViewController.swift
//  InstagramCloneFirebase
//
//  Created by Taha Turan on 4.05.2023.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
    }
    



}

// MARK: TableView Listeleme islemleri
extension FeedViewController: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell" , for: indexPath) as! FeedTableViewCell
        
        cell.commentLabel.text = "deneme"
        cell.userNameLabel.text = "tahaaturan"
        cell.likeLabel.text = "15"
        cell.userImageView.image = UIImage(named: "select.png")
        
        return cell
    }
    
}
