//
//  HomeTableViewCell.swift
//  HomeTableViewCell
//
//  Created by Sanjeev Kumar on 31/11/09.
//

import UIKit

class HomeTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        setupUI()
    }
    
    private func setupUI() {
        topImageView.makeCirculer()
    }
    
    func configureCell(item: SpecialReport) {
        topImageView.loadImage(urlStr: item.headlineImageURL ?? "")
        titleLable.text = item.title
        descLabel.text = item.specialReportDescription
    }
}
