//
//  ItemTableViewCell.swift
//  ToDoList
//
//  Created by Hoge on 2023/09/04.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(title: String, detail: String, date: String) {
        titleLabel.text = title
        detailLabel.text = detail
        dateLabel.text = date
    }
    
}
