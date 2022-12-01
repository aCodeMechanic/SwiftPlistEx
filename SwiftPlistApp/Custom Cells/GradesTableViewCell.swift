//
//  GradesTableViewCell.swift
//  SwiftPlistApp
//
//  Created by mac on 29/10/22.
//

import UIKit

class GradesTableViewCell: UITableViewCell {

    @IBOutlet weak var lblGrade: UILabel!
    @IBOutlet weak var lblCourseName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
