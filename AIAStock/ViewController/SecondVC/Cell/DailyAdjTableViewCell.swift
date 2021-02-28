//
//  DailyAdjTableViewCell.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 01/03/2021.
//

import UIKit

class DailyAdjTableViewCell: UITableViewCell {

    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
