//
//  CourseCollectionViewCell.swift
//  AnywhereFitness2
//
//  Created by Zachary Thacker on 10/20/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import UIKit

class CourseCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionViewImage: UIImageView!
    @IBOutlet weak var collectionViewLabel: UILabel!
    
    static let identifier = "CourseCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CourseCollectionViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with course: Course) {
        self.collectionViewImage.image = UIImage(named: course.image ?? "yoga3")
        self.collectionViewLabel.text = course.courseTitle
    }
    
}
