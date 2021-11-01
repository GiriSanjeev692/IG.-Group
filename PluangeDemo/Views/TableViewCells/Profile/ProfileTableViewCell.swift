//
//  ProfileTableViewCell.swift
//  ProfileTableViewCell
//
//  Created by Sanjeev Kumar on 31/10/21.
//

import UIKit

class ProfileTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupView() {
        topImageView.makeCirculer()
    }
    
    func configureCell(item: Artist?) {
        topImageView.loadImage(urlStr: item?.artworkUrl60 ?? "")
        nameLabel.text = item?.artistName
    }
}
