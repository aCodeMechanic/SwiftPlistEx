//
//  Grade.swift
//  SwiftPlistApp
//
//  Created by mac on 29/10/22.
//

import Foundation
import UIKit

class Grade: Equatable, Codable {
    static func == (lhs: Grade, rhs: Grade) -> Bool {
        return lhs.courseName == rhs.courseName
        && lhs.grade == rhs.grade
        && lhs.instructorName == rhs.instructorName
        && lhs.semester == rhs.semester
        && lhs.year == rhs.year
        && lhs.dateCreated == rhs.dateCreated
    }
    
    var courseName: String
    var grade: String
    var instructorName: String
    var semester: String
    var year: Int
    var dateCreated: Date
    let itemKey: String
    
    init(courseName: String, instructorName: String, grade: String,semester: String, year: Int) {
        self.courseName = courseName
        self.grade = grade
        self.semester = semester
        self.year = year
        self.instructorName = instructorName
        self.dateCreated = Date()
        self.itemKey = UUID().uuidString
    }
    convenience init() {
            self.init(courseName: "", instructorName: "", grade: "", semester: "", year: 2001)
    }
}
