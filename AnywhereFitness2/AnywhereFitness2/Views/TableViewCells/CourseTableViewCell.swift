//
//  CourseTableViewCell.swift
//  AnywhereFitness2
//
//  Created by Zachary Thacker on 10/20/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Properties
    var courses = [Course]()
    
    
    
    static let identifier = "CourseTableViewCell"
    
    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var courseTypeLabel: UILabel!
    
    func configure(with courses: [Course]) {
        self.courses = courses
        collectionView.reloadData()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CourseTableViewCell",
                     bundle: nil)
    }
//POTENTIAL PROBLEM
    override func awakeFromNib() {
        super.awakeFromNib()
    collectionView.register(CourseCollectionViewCell.nib(), forCellWithReuseIdentifier: CourseCollectionViewCell.identifier)
    collectionView.delegate = self
    collectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // CollectionView Jazz
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseCollectionViewCell.identifier, for: indexPath) as! CourseCollectionViewCell
        cell.configure(with: courses[indexPath.row])
        cell.layer.cornerRadius = 25
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 220, height: 180)
    }
    
    

}
