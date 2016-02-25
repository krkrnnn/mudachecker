//
//  SpendingTableViewCell.swift
//  mudachecker
//
//  Created by 福田かるな on 2016/02/25.
//  Copyright © 2016年 net.karuna. All rights reserved.
//

import UIKit

class SpendingTableViewCell: UITableViewCell {
    
    @IBOutlet var koumokuLabel: UILabel!
    @IBOutlet var spendingLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
