//
//  NewsPageCell.swift
//  R - news
//
//  Created by anna on 14.08.2022.
//

import UIKit

final class NewsPageCell: UITableViewCell {
    
    static let identifier = "NewsPageCell"
    
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var timeOfUpload: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
