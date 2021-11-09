//
//  DetailImageTableViewCell.swift
//  DetailImageTableViewCell
//
//  Created by Sanjeev Kumar on 08/11/21.
//

import UIKit

class DetailImageTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var newsImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(item: SpecialReport?) {
        newsImageView.loadImage(urlStr: item?.headlineImageURL ?? "")
    }                                                                                                                                                                                                                       
    
}
