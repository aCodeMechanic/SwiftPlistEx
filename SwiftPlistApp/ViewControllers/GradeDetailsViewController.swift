//
//  GradeDetailsViewController.swift
//  SwiftPlistApp
//
//  Created by mac on 29/10/22.
//

import UIKit

class GradeDetailsViewController: UIViewController {
    var gradeStore: GradeStore!
    var grade: Grade!
    
    @IBOutlet weak var tfCourseName: UITextField!
    @IBOutlet weak var tfGrades: UITextField!
    @IBOutlet weak var tfInstructorName: UITextField!
    @IBOutlet weak var tfSemester: UITextField!
    @IBOutlet weak var tfYear: UITextField!
    
    @IBOutlet weak var btnDelete: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if grade == nil {
            self.title = "Create"
            self.btnDelete.isHidden = true
        } else {
            self.title = "\(grade.courseName) Details"
            self.btnDelete.isHidden = false
            self.tfCourseName.text = grade.courseName
            self.tfGrades.text = grade.grade
            self.tfInstructorName.text = grade.instructorName
            self.tfSemester.text = grade.semester
            self.tfYear.text = "\(grade.year)"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteGrades(_ sender: Any) {
        gradeStore.removeGrades(grade)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func saveGrades(_ sender: Any) {
        
        var message = ""
        if (tfCourseName.text == ""){
            message = "Enter Course Name"
        }
        if (tfInstructorName.text == ""){
            message = "Enter Instructor Name"
        }
        if (tfGrades.text == ""){
            message = "Enter Grade"
        }
        if (tfSemester.text == ""){
            message = "Enter Semester"
        }
        if (tfYear.text == ""){
            message = "Enter Year"
        }
        if !message.isEmpty {
            var dialogMessage = UIAlertController(title: "Uh oh!", message: message, preferredStyle: .actionSheet)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                debugPrint("Ok button tapped")
             })
            
            //Add OK button to a dialog message
            dialogMessage.addAction(ok)

            // Present Alert to
            self.present(dialogMessage, animated: true, completion: nil)
            return
        } else {
            if grade == nil {
                self.gradeStore.addGrades(courseName: tfCourseName.text ?? "", instructorName: tfInstructorName.text ?? "", grade: tfGrades.text ?? "", semester: tfSemester.text ?? "", year: Int(tfYear.text ?? "2001") ?? 2001)
            } else {
                grade.courseName = tfCourseName.text ?? ""
                grade.grade = tfGrades.text ?? ""
                grade.year = Int(tfYear.text ?? "2001")!
                grade.instructorName = tfInstructorName.text ?? ""
                grade.semester = tfSemester.text ?? ""
                gradeStore.saveChanges()
            }
            self.navigationController?.popViewController(animated: true)
            
        }
    }
}
