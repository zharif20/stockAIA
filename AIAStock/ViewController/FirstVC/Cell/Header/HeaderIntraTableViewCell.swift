//
//  HeaderIntraTableViewCell.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 28/02/2021.
//

import UIKit

class HeaderIntraTableViewCell: UITableViewCell {

    @IBOutlet weak var openButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var dateButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        openButton.tag = 0
        highButton.tag = 1
        lowButton.tag = 2
        dateButton.tag = 3
    }
    
}
