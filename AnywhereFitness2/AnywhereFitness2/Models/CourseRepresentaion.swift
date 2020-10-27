//
//  CourseRepresentaion.swift
//  AnywhereFitness2
//
//  Created by Zachary Thacker on 10/15/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import Foundation


struct CourseRepresentation: Codable {
    var identifier: Int64
    var dateTime: Date
    var courseTitle: String
    var courseType: String
    var duration: String
    var location: String
    var skillLevel: String
    var maxCourseSize: Int64
    var image: String
    var courseDetails: String
    var currentCourseSize: Int64
    var instructorId: Int64
}


