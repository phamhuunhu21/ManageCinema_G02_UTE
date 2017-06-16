//
//  HistoryTableViewCell.swift
//  MovieG02
//
//  Created by Pham Huu Nhu on 6/16/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cinemaLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var chairLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
