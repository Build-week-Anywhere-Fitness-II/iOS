//
//  CourseRepresentaion.swift
//  AnywhereFitness2
//
//  Created by Zachary Thacker on 10/15/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import Foundation


struct CourseRepresentation: Decodable {
    let id: Int
    let time: Date
    let courseTitle: String
    let courseType: String
    let duration: String
    let location: String
    let skillLevel: String
    let maxCourseSize: Int
    let image: String
    let courseDetails: String
}


