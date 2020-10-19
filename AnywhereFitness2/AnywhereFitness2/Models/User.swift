//
//  UserRepresentation.swift
//  AnywhereFitness2
//
//  Created by Zachary Thacker on 10/15/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let isInstructor: Bool
    let name: String
    let password: String
    let username: String
    let image: String
}
