//
//  DisplayTableViewCell.swift
//  ParsingDataSiswa
//
//  Created by Muhammad Hilmy Fauzi on 2/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class DisplayTableViewCell: UITableViewCell {

    @IBOutlet weak var labelID: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
