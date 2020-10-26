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
    @IBOutlet weak var cellTintView: UIView!
    
    static let identifier = "CourseCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CourseCollectionViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with course: Course) {
        self.collectionViewImage.image = UIImage(named: course.image ?? "\(course.courseType)")
        self.collectionViewLabel.text = course.courseTitle
        if course.courseType == "Yoga"{
            self.cellTintView.backgroundColor = #colorLiteral(red: 0.05784452083, green: 0.1804709784, blue: 0.1830416455, alpha: 0.7057579787)
        }
        if course.courseType == "Weight Lifting"{
            self.cellTintView.backgroundColor = #colorLiteral(red: 0.1830416455, green: 0.1184627755, blue: 0.100207462, alpha: 0.7057579787)
        }
        if course.courseType == "Cross Fit"{
            self.cellTintView.backgroundColor = #colorLiteral(red: 0.05784452083, green: 0.1804709784, blue: 0.1830416455, alpha: 0.7057579787)
        }
        if course.courseType == "Boxing"{
            self.cellTintView.backgroundColor = #colorLiteral(red: 0.1830416455, green: 0.1184627755, blue: 0.100207462, alpha: 0.7057579787)
        }
        if course.courseType == "Martial Arts"{
            self.cellTintView.backgroundColor = #colorLiteral(red: 0.05784452083, green: 0.1804709784, blue: 0.1830416455, alpha: 0.7057579787)
        }
        if course.courseType == "Other"{
            self.cellTintView.backgroundColor = #colorLiteral(red: 0.1830416455, green: 0.1184627755, blue: 0.100207462, alpha: 0.7057579787)
        }
        
    }
    
}
