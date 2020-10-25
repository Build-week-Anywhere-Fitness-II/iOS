//
//  Course+Convinience.swift
//  AnywhereFitness2
//
//  Created by Zachary Thacker on 10/20/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import UIKit
import CoreData


extension Course {
    
    // Computed variable -> representation
    var representation: CourseRepresentation? {
        guard let identifier = identifier ?? 0,
              let dateTime = dateTime,
              let courseTitle = courseTitle,
              let courseType = courseType,
              let duration = duration,
              let location = location,
              let skillLevel = skillLevel,
              let maxCourseSize = maxCourseSize ?? 0,
              let image = image,
              let courseDetails = courseDetails,
              let currentCourseSize = currentCourseSize ?? 0,
              let instructorId = instructorId ?? 0 else { return nil }
        
        return  CourseRepresentation(identifier: identifier, dateTime: dateTime, courseTitle: courseTitle, courseType: courseType, duration: duration, location: location, skillLevel: skillLevel, maxCourseSize: maxCourseSize, image: image, courseDetails: courseDetails, currentCourseSize: currentCourseSize, instructorId: instructorId)
        


    }
    
    @discardableResult
    convenience init(identifier: Int64 = 0,
                     dateTime: Date,
                     courseTitle: String,
                     courseType: String,
                     duration: String,
                     image: String,
                     location: String,
                     skillLevel: String,
                     maxCourseSize: Int64,
                     currentCourseSize: Int64,
                     courseDetails: String,
                     instructorId: Int64 = 0,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.identifier = Int64(identifier)
        self.dateTime = dateTime
        self.courseTitle = courseTitle
        self.courseType = courseType
        self.duration = duration
        self.image = image
        self.location = location
        self.skillLevel = skillLevel
        self.maxCourseSize = Int64(maxCourseSize)
        self.currentCourseSize = Int64(currentCourseSize)
        self.courseDetails = courseDetails
        self.instructorId = Int64(instructorId)
    }
    
    convenience init?(representation: CourseRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(identifier: Int64(representation.identifier),
                  dateTime: representation.dateTime,
                  courseTitle: representation.courseTitle,
                  courseType: representation.courseType,
                  duration: representation.duration,
                  image: representation.image,
                  location: representation.location,
                  skillLevel: representation.skillLevel,
                  maxCourseSize: Int64(representation.maxCourseSize),
                  currentCourseSize: Int64(representation.currentCourseSize),
                  courseDetails: representation.courseDetails,
                  instructorId: Int64(representation.instructorId),
                  context: context)
        
    }
    
    // Representation convinience init
//    @discardableResult
//    convenience init?(representation: CourseRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
//
//        self.init(
//
//    }

}

