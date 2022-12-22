//
//  TodoCellTableViewCell.swift
//  TodoApp
//
//  Created by MZ01-MINCKAN on 2022/12/22.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priorityView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
