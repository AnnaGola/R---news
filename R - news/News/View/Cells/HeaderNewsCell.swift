//
//  HeaderNewsCell.swift
//  R - news
//
//  Created by anna on 20.08.2022.
//

import UIKit
import SnapKit
import Kingfisher

final class HeaderNewsTableViewCell: UITableViewCell {

//MARK: - Identifier
    static let identifier = "HeaderNewsTableViewCell"

//MARK: - Properties
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let publisherLabel = UILabel()

//MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewController()
        setupNewsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//MARK: - Setup
    private func setupViewController() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(publisherLabel)
        
        iconImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(20)
            make.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).inset(-10)
            make.leading.trailing.equalTo(iconImageView)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.leading.equalTo(iconImageView.snp.leading)
            make.width.equalTo(100)
        }
        
        publisherLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.leading.equalTo(dateLabel.snp.trailing).inset(-10)
            make.trailing.equalTo(iconImageView.snp.trailing)
        }
    }
        
        private func setupNewsView() {
            iconImageView.backgroundColor = .secondarySystemBackground
            iconImageView.contentMode = .scaleAspectFill
            iconImageView.layer.cornerRadius = 10
            iconImageView.clipsToBounds = true
            
            titleLabel.numberOfLines = 2
            titleLabel.textColor = .label
            titleLabel.textAlignment = .left
            titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
            
            dateLabel.numberOfLines = 1
            dateLabel.textColor = .secondaryLabel
            dateLabel.textAlignment = .left
            dateLabel.font = .systemFont(ofSize: 14, weight: .regular)
            
            publisherLabel.numberOfLines = 1
            publisherLabel.textColor = .secondaryLabel
            publisherLabel.textAlignment = .left
            publisherLabel.font = .systemFont(ofSize: 14, weight: .regular)
            
        }

//MARK: - Configuration
    func configure(with model: News) {
        guard let url = URL(string: model.urlToImage ?? "") else { return }
        
        iconImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.5)),
                .cacheOriginalImage
            ])
        
        dateLabel.text = model.publishedAt.stringToDate()?.timeAgoDisplay()
        titleLabel.text = model.title
        publisherLabel.text = model.source.name
    }
}


