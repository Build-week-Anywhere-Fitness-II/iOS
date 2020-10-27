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
    var categories = ["Yoga", "Weight Lifting", "Cross Fit", "Boxing", "Martial Arts", "Other" ]
    var yogaCourses: [Course] = []
    var weightLiftingCourses: [Course] = []
    var crossFitCourses: [Course] = []
    var boxingCourses: [Course] = []
    var martialArtsCourses: [Course] = []
    var otherCourses: [Course] = []
    
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
                              courseTitle: "Other",
                              courseType: "Other",
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
                              courseTitle: "Weight Lifting",
                              courseType: "Weight Lifting",
                              duration: "5 Hours",
                              image: "yoga2",
                              location: "Tallahassee",
                              skillLevel: "Advanced",
                              maxCourseSize: 25,
                              currentCourseSize: 1,
                              courseDetails: "Lets make it HOT"))
        courses.append(Course(dateTime: Date(),
                              courseTitle: "Weight Lifting",
                              courseType: "Weight Lifting",
                              duration: "5 Hours",
                              image: "yoga2",
                              location: "Tallahassee",
                              skillLevel: "Advanced",
                              maxCourseSize: 25,
                              currentCourseSize: 1,
                              courseDetails: "Lets make it HOT"))
        courses.append(Course(dateTime: Date(),
                              courseTitle: "Cross Fit",
                              courseType: "Cross Fit",
                              duration: "5 Hours",
                              image: "yoga2",
                              location: "Tallahassee",
                              skillLevel: "Advanced",
                              maxCourseSize: 25,
                              currentCourseSize: 1,
                              courseDetails: "Lets make it HOT"))
        courses.append(Course(dateTime: Date(),
                              courseTitle: "Boxing",
                              courseType: "Boxing",
                              duration: "5 Hours",
                              image: "yoga2",
                              location: "Tallahassee",
                              skillLevel: "Advanced",
                              maxCourseSize: 25,
                              currentCourseSize: 1,
                              courseDetails: "Lets make it HOT"))
        organizeCourses()
        tableView.register(CourseTableViewCell.nib(), forCellReuseIdentifier: CourseTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func organizeCourses() {
        for course in courses {
            if course.courseType == "Yoga"{
                yogaCourses.append(course)
            }
            if course.courseType == "Weight Lifting"{
                weightLiftingCourses.append(course)
            }
            if course.courseType == "Cross Fit"{
                crossFitCourses.append(course)
            }
            if course.courseType == "Boxing"{
                boxingCourses.append(course)
            }
            if course.courseType == "Martial Arts"{
                martialArtsCourses.append(course)
            }
            if course.courseType == "Other"{
                otherCourses.append(course)
            }
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(courses)
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CourseTableViewCell.identifier, for: indexPath) as! CourseTableViewCell
        cell.configure(with: courses)
        if indexPath.section == 0 {
            cell.courses = yogaCourses
            cell.courseTypeLabel.text = "Yoga"
            
        } else if indexPath.section == 1 {
            cell.courses = weightLiftingCourses
            cell.courseTypeLabel.text = "Weight Lifting"

        } else if indexPath.section == 2 {
            cell.courses = crossFitCourses
            cell.courseTypeLabel.text = "Cross Fit"

        } else if indexPath.section == 3 {
            cell.courses = boxingCourses
            cell.courseTypeLabel.text = "Boxing"

        } else if indexPath.section == 4 {
            cell.courses = martialArtsCourses
            cell.courseTypeLabel.text = "Martial Arts"

        } else if indexPath.section == 5 {
            cell.courses = otherCourses
            cell.courseTypeLabel.text = "Other"

        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    //DELETE MEEEEEE
    
    
    
}

