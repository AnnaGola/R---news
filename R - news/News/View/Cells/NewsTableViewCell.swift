//
//  NewsTableViewCell.swift
//  R - news
//
//  Created by anna on 20.08.2022.
//

import UIKit
import SnapKit
import Kingfisher

final class NewsTableViewCell: UITableViewCell {
    
    //MARK: - Identifier
    static let identifier = "NewsTableViewCell"
    
    //MARK: - Properties
    private var isLoaded = false
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
    
    //MARK: - Setups
    private func setupViewController() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(publisherLabel)
        
        iconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.width.height.equalTo(80)
            make.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.top)
            make.leading.equalTo(iconImageView.snp.trailing).inset(-10)
            make.trailing.equalToSuperview().inset(20)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.leading.equalTo(titleLabel.snp.leading)
            make.width.equalTo(100)
        }
        
        publisherLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.leading.equalTo(dateLabel.snp.trailing).inset(-10)
            make.trailing.equalTo(titleLabel.snp.trailing)
        }
    }
    
    private func setupNewsView() {
        iconImageView.backgroundColor = .secondarySystemBackground
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.layer.cornerRadius = 10
        iconImageView.clipsToBounds = true
        
        titleLabel.numberOfLines = 3
        titleLabel.textColor = .label
        titleLabel.textAlignment = .left
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        dateLabel.numberOfLines = 1
        dateLabel.textColor = .secondaryLabel
        dateLabel.textAlignment = .left
        dateLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        publisherLabel.numberOfLines = 1
        publisherLabel.textColor = .secondaryLabel
        publisherLabel.textAlignment = .center
        publisherLabel.font = .systemFont(ofSize: 12, weight: .regular)
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
        iconImageView.reloadInputViews()
    }
}

