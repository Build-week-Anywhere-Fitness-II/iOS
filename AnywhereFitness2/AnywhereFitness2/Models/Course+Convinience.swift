//
//  Course+Convinience.swift
//  AnywhereFitness2
//
//  Created by Zachary Thacker on 10/20/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import Foundation
import CoreData


extension Course {
    
    @discardableResult
    convenience init(id: Int,
                     time: Date,
                     courseDetails: String,
                     courseTitle: String,
                     courseType: String,
                     durration: String,
                     image: String,
                     location: String,
                     skillLevel: String,
                     maxCourseSize: Int,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
       
        self.init(context: context)
        self.id = Int64(id)
        self.time = time
        self.courseDetails = courseDetails
        self.courseTitle = courseTitle
        self.durration = durration
        self.image = image
        self.location = location
        self.skillLevel = skillLevel
        self.maxCourseSize = Int64(maxCourseSize)
    }
    
//        // Representation convinience init
//    @discardableResult
//    convenience init(representation: CourseRepresentation) {
//        self.init(id: representation.id,
//                  time: representation.time,
//                  courseDetails: representation.courseDetails,
//                  courseTitle: representation.courseTitle,
//                  courseType: representation.courseType,
//                  durration: representation.durration,
//                  image: representation.image,
//                  location: representation.location,
//                  skillLevel: representation.skillLevel,
//                  maxCourseSize: representation.maxCourseSize)
//    }
//
//    // Computed variable -> representation
//    var representation: CourseRepresentation? {
//        guard let id = id,
//              let courseTitle = courseTitle,
//              let location = location else  {return nil}
//
//        return CourseRepresentation(id = Int(id),
//                                    time = time,
//                                    courseDetails = courseDetails,
//                                    courseTitle = courseTitle,
//                                    durration = durration,
//                                    image = image,
//                                    location = location,
//                                    skillLevel = skillLevel,
//                                    maxCourseSize = Int(maxCourseSize))
//    }
//}
}
