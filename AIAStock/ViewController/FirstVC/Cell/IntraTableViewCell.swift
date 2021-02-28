//
//  IntraTableViewCell.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 28/02/2021.
//

import UIKit

class IntraTableViewCell: UITableViewCell {

    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var openValue: UILabel!
    @IBOutlet weak var highValue: UILabel!
    @IBOutlet weak var lowValue: UILabel!
    @IBOutlet weak var dateValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
