//
//  HomeViewController.swift
//  AnywhereFitness2
//
//  Created by Zachary Thacker on 10/20/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    var courses = [Course]()
    var currentUser : User?

    //MARK: - IBOutlets
    //User Info
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    //Random Quote
    @IBOutlet weak var inspoQuoteTextField: UILabel!
    //TableView
    @IBOutlet weak var tableView: UITableView!

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(CourseTableViewCell.nib(), forCellReuseIdentifier: CourseCollectionViewCell.identifier)
//        tableView.delegate = self
//        tableView.dataSource = self
        loadCurrentUserInfo()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadCurrentUserInfo()
        self.viewDidLoad()
    }
    
//    func userImageLoad(currentUser: User) {
//        FirebaseController.shared.getImage(imageUrl: currentUser.image, completion: { (image) in
//            DispatchQueue.main.async {
//            self.userImage.image = image
//                print(self.userImage.image)
//            }
//        })
//    }
    
    func loadCurrentUserInfo() {
        FirebaseController.shared.getUser { (user) in
            self.usernameLabel.text = user.username
            FirebaseController.shared.getImage(imageUrl: user.image, completion: { image in
                              DispatchQueue.main.async {
                                  self.userImage.image = image
                              }
                          })
                      }
        
        }
          
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
