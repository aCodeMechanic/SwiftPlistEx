//
//  GradeStore.swift
//  SwiftPlistApp
//
//  Created by mac on 29/10/22.
//

import Foundation
import UIKit

class GradeStore {
    var gradesList = [Grade]()
    let itemArchiveURL: URL = {
        // URL where the grades will be stored
        let documentsDirectories =
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("grades.plist")
    }()
    
    init() {
        // When initializing read all data from grades.plist
        do {
            let data = try Data(contentsOf: itemArchiveURL)
            let unarchiver = PropertyListDecoder()
            let items = try unarchiver.decode([Grade].self, from: data)
            gradesList = items
        } catch {
            print("Error reading in saved items: \(error)")
        }
    }
    
    @discardableResult func addGrades(courseName: String, instructorName: String, grade: String, semester: String, year: Int) -> Grade {
        /**
         Create new Grade Object and save the List in grades.plist.
         */
        let newItem = Grade(courseName: courseName, instructorName: instructorName, grade: grade, semester: semester, year: year)
        
        gradesList.append(newItem)
        _ = self.saveChanges()
        return newItem
    }
    
    func removeGrades(_ grade: Grade) {
        /**
         Remove  Grade Object and save the List in grades.plist.
         */
        if let index = gradesList.firstIndex(of: grade) {
            gradesList.remove(at: index)
        }
        _ = self.saveChanges()
    }
    
    @objc func saveChanges() -> Bool {
        /**
         Saves the GradesIem List in grades.plist by saving in temporary file and then replacing original file with this
         */
        print("Saving items to: \(itemArchiveURL)")
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(gradesList)
            try data.write(to: itemArchiveURL, options: [.atomic])
            print("Saved all of the items")
            return true
        } catch let encodingError {
            print("Error encoding allItems: \(encodingError)")
            return false
        }
    }
}
