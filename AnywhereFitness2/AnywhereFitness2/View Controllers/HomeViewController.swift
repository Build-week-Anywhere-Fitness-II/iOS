//
//  HomeViewController.swift
//  AnywhereFitness2
//
//  Created by Zachary Thacker on 10/20/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    //MARK: - Properties
    var courses = [Course]()
    var currentUser : User?

    //MARK: - IBOutlets
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UILabel!
    @IBOutlet weak var inspoQuoteTextField: UILabel!
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
        
        courses.append(Course(dateTime: Date(),
                              courseTitle: "Hot Yoga",
                              courseType: "Yoga",
                              duration: "5 Hours",
                              image: "yoga2",
                              location: "Tallahassee",
                              skillLevel: "Advanced",
                              maxCourseSize: 25,
                              currentCourseSize: 1,
                              courseDetails: "Lets make it HOT"))
        courses.append(Course(dateTime: Date(),
                              courseTitle: "Cold Yoga",
                              courseType: "Yoga",
                              duration: "5 Hours",
                              image: "yoga2",
                              location: "Tallahassee",
                              skillLevel: "Advanced",
                              maxCourseSize: 25,
                              currentCourseSize: 1,
                              courseDetails: "Lets make it HOT"))
        courses.append(Course(dateTime: Date(),
                              courseTitle: "Med Yoga",
                              courseType: "Yoga",
                              duration: "5 Hours",
                              image: "yoga2",
                              location: "Tallahassee",
                              skillLevel: "Advanced",
                              maxCourseSize: 25,
                              currentCourseSize: 1,
                              courseDetails: "Lets make it HOT"))
        courses.append(Course(dateTime: Date(),
                              courseTitle: "Power Hour",
                              courseType: "Yoga",
                              duration: "5 Hours",
                              image: "yoga2",
                              location: "Tallahassee",
                              skillLevel: "Advanced",
                              maxCourseSize: 25,
                              currentCourseSize: 1,
                              courseDetails: "Lets make it HOT"))
        courses.append(Course(dateTime: Date(),
                              courseTitle: "Baby Yoga",
                              courseType: "Yoga",
                              duration: "5 Hours",
                              image: "yoga2",
                              location: "Tallahassee",
                              skillLevel: "Advanced",
                              maxCourseSize: 25,
                              currentCourseSize: 1,
                              courseDetails: "Lets make it HOT"))
        courses.append(Course(dateTime: Date(),
                              courseTitle: "Yoda Yoga",
                              courseType: "Yoga",
                              duration: "5 Hours",
                              image: "yoga2",
                              location: "Tallahassee",
                              skillLevel: "Advanced",
                              maxCourseSize: 25,
                              currentCourseSize: 1,
                              courseDetails: "Lets make it HOT"))
        
        tableView.register(CourseTableViewCell.nib(), forCellReuseIdentifier: CourseTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(courses)
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CourseTableViewCell.identifier, for: indexPath) as! CourseTableViewCell
        cell.configure(with: courses)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }


}
