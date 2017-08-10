//
//  PenTableViewCell.swift
//  Penpal
//
//  Created by hu tsun hao on 8/8/17.
//  Copyright © 2017 hu. All rights reserved.
//

import UIKit

class PenTableViewCell: UITableViewCell {

    @IBOutlet weak var PenName: UILabel!
    @IBOutlet weak var DateFilled: UILabel!
    @IBOutlet weak var PenPhoto: UIImageView!
    @IBOutlet weak var InkFilled: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
