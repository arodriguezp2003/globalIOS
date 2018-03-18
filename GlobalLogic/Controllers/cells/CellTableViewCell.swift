//
//  CellTableViewCell.swift
//  GlobalLogic
//
//  Created by Alejandro  Rodriguez on 17-03-18.
//  Copyright © 2018 Alejandro  Rodriguez. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {
    @IBOutlet weak var xImage: UIImageView!
    @IBOutlet weak var xTitle: UILabel!
    @IBOutlet weak var xSubtitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let bgColorView = UIView()
        bgColorView.backgroundColor = util.shared.UIColorFromHex(0xF2F5FF)
         self.selectedBackgroundView = bgColorView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
