//
//  MyTableViewCell.swift
//  FriendApp
//
//  Created by Esraa Hassan on 5/31/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var friendID: UILabel!
    @IBOutlet weak var friendAge: UILabel!
    @IBOutlet weak var friendName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
