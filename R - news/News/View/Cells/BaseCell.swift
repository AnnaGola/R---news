//
//  BaseCell.swift
//  R - news
//
//  Created by anna on 20.08.2022.
//

import UIKit
import SnapKit
import Kingfisher

final class BaseCell: UITableViewCell, Loadable {

//MARK: - Identifier
    static let identifier = "BaseCell"

//MARK: - Properties
    private var iconImageLayer = CAGradientLayer()
    private var titleLayer = CAGradientLayer()
    private var dateLayer = CAGradientLayer()
    private var publisherLayer = CAGradientLayer()
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let publisherLabel = UILabel()
    
//MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//MARK: - Setup
    private func setup() {
        iconImageLayer.startPoint = CGPoint(x: 0, y: 0)
        iconImageLayer.endPoint = CGPoint(x: 1, y: 1)
        iconImageView.layer.addSublayer(iconImageLayer)
        
        titleLayer.startPoint = CGPoint(x: 0, y: 0)
        titleLayer.endPoint = CGPoint(x: 1, y: 0.5)
        titleLabel.layer.addSublayer(titleLayer)
        
        dateLayer.startPoint = CGPoint(x: 0, y: 0)
        dateLayer.endPoint = CGPoint(x: 1, y: 0.5)
        dateLabel.layer.addSublayer(dateLayer)
        
        publisherLayer.startPoint = CGPoint(x: 0, y: 0)
        publisherLayer.endPoint = CGPoint(x: 1, y: 0.5)
        publisherLabel.layer.addSublayer(publisherLayer)
        
        publisherLabel.numberOfLines = 1
        publisherLabel.textColor = .secondaryLabel
        publisherLabel.textAlignment = .center
        publisherLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        dateLabel.numberOfLines = 1
        dateLabel.textColor = .secondaryLabel
        dateLabel.textAlignment = .left
        dateLabel.font = .systemFont(ofSize: 12, weight: .regular)

        titleLabel.numberOfLines = 3
        titleLabel.textColor = .label
        titleLabel.textAlignment = .left
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        iconImageView.backgroundColor = .secondarySystemBackground
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.layer.cornerRadius = 10
        iconImageView.clipsToBounds = true
        
        let imageGroup = makeAnimationGroup()
        imageGroup.beginTime = 0.0
        iconImageLayer.add(imageGroup, forKey: "backgroundColor")
        
        let titleGroup = makeAnimationGroup(previousGroup: imageGroup)
        titleLayer.add(titleGroup, forKey: "backgroundColor")
        
        let dateGroup = makeAnimationGroup(previousGroup: titleGroup)
        dateLayer.add(dateGroup, forKey: "backgroundColor")
        
        let publisherGroup = makeAnimationGroup(previousGroup: dateGroup)
        publisherLayer.add(publisherGroup, forKey: "backgroundColor")
    }

//MARK: - Layout
    private func layout() {
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageLayer.frame = iconImageView.bounds
        iconImageLayer.cornerRadius = 5
        
        titleLayer.frame = titleLabel.bounds
        titleLayer.cornerRadius = 3
        
        dateLayer.frame = dateLabel.bounds
        dateLayer.cornerRadius = 3
        
        publisherLayer.frame = publisherLabel.bounds
        publisherLayer.cornerRadius = 3
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

