//
//  ViewController.swift
//  SwiftPlistApp
//
//  Created by mac on 29/10/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var gradeStore: GradeStore!

    @IBOutlet weak var lblNoGrades: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // Initialize GradeStore repo to get Data
        gradeStore = GradeStore()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gradeStore.gradesList.count
    }
    
    @IBAction func addGrades(_ sender: Any) {
        
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "GradeDetailsViewController") as! GradeDetailsViewController
        vc.gradeStore = gradeStore
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Reload data everytime view is about to appear
        tableView.reloadData()
        if gradeStore != nil && !gradeStore.gradesList.isEmpty {
            self.tableView.isHidden = false
            self.lblNoGrades.isHidden = true
        } else {
            self.tableView.isHidden = true
            self.lblNoGrades.isHidden = false
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCell(withIdentifier: "GradesTableViewCell") as! GradesTableViewCell
        cell.lblCourseName.text = gradeStore.gradesList[indexPath.row].courseName
        cell.lblGrade.text = gradeStore.gradesList[indexPath.row].grade
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc = self.storyboard?.instantiateViewController(withIdentifier: "GradeDetailsViewController") as! GradeDetailsViewController
        vc.gradeStore = gradeStore
        vc.grade = gradeStore.gradesList[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

