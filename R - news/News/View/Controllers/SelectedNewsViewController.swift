//
//  SelectedNewsViewController.swift
//  R - news
//
//  Created by anna on 20.08.2022.
//

import UIKit
import SnapKit
import Kingfisher
import SafariServices

final class SelectedNewsViewController: UIViewController {
    
//MARK: - Properties
    var news: News
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let authorLabel = UILabel()
    private let imageView = UIImageView()
    private let newsPageButton = UIButton()
        
    
//MARK: - Initialization
    init(news: News) {
        self.news = news
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupLabels()
        setupImageView()
        setupNewsPageButton()
        setupLayout()
    }
    
//MARK: - Setups
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        navigationItem.title = news.source.name
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceVertical = true
    }
    
    private func setupLabels() {
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .label
        titleLabel.textAlignment = .natural
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        dateLabel.numberOfLines = 1
        dateLabel.textColor = .label
        dateLabel.textAlignment = .left
        dateLabel.font = .systemFont(ofSize: 14, weight: .light)
        
        authorLabel.numberOfLines = 2
        authorLabel.textColor = .label
        authorLabel.textAlignment = .left
        authorLabel.font = .systemFont(ofSize: 15, weight: .regular)
        
        titleLabel.text = news.title
        dateLabel.text = Date.string(iso: news.publishedAt)
        authorLabel.text = news.author ?? ""
    }
    
    private func setupImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        guard let url = URL(string: news.urlToImage ?? "") else { return }
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.5)),
                .cacheOriginalImage
            ])
    }
    
    private func setupNewsPageButton() {
        newsPageButton.setTitle("Read more", for: .normal)
        newsPageButton.setTitleColor(.label, for: .normal)
        newsPageButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        newsPageButton.backgroundColor = .secondarySystemBackground
        newsPageButton.layer.cornerRadius = 10
        newsPageButton.layer.borderWidth = 1
        newsPageButton.layer.masksToBounds = true
        newsPageButton.addTarget(
            self,
            action: #selector(didTapNewsPageButton),
            for: .touchUpInside
        )
    }
    
    @objc private func didTapNewsPageButton() {
        guard let url = URL(string: news.url) else { return }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    private func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(authorLabel)
        containerView.addSubview(imageView)
        containerView.addSubview(newsPageButton)
        
        let padding = Constants.padding
        
        scrollView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        containerView.snp.makeConstraints { make in
            make.height.equalTo(view)
            make.leading.trailing.equalTo(view).inset(padding)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.width.equalTo(containerView.snp.width)
            make.top.equalTo(containerView).inset(padding)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.width.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).inset(-padding)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.width.equalTo(titleLabel)
            make.top.equalTo(dateLabel.snp.bottom).inset(-padding)
        }
        
        imageView.snp.makeConstraints { make in
            make.width.equalTo(titleLabel)
            make.top.equalTo(authorLabel.snp.bottom).inset(-padding)
            make.height.lessThanOrEqualTo(containerView.snp.width)
        }
        
        newsPageButton.snp.makeConstraints { make in
            make.width.equalTo(titleLabel)
            make.top.equalTo(imageView.snp.bottom).inset(-padding)
        }
    }
}
