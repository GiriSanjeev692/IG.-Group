//
//  DetailsTableViewCell.swift
//  DetailsTableViewCell
//
//  Created by Sanjeev Kumar on 31/11/09.
//

import UIKit

class DetailsTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(title: String?, desc: String?) {
        titleLabel.text = title
        descLabel.text = desc ?? "-"
    }
}
