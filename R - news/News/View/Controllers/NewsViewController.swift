//
//  NewsViewController.swift
//  R - news
//
//  Created by anna on 20.08.2022.
//

import UIKit
import SnapKit

//MARK: - ViewController Protocol
protocol NewsViewControllerProtocol: AnyObject {
    var viewModel: NewsViewModelProtocol { get }
}

//MARK: - Cell enum
enum CellType {
    case header
    case list
}

final class NewsViewController: UIViewController, NewsViewControllerProtocol {

//MARK: - Properties
    var viewModel: NewsViewModelProtocol
    
    private let sections = [CellType.header, CellType.list]
    private let searchController = UISearchController(searchResultsController: nil)
    private let refreshControl = UIRefreshControl()
    private var isSearching = false
    private var isLoaded = false
    
    private let newsTableView = UITableView(frame: .zero, style: .grouped)
    private var activityIndicator = UIActivityIndicatorView(style: .medium) {
        didSet {
            activityIndicator.hidesWhenStopped = true
            activityIndicator.tintColor = .label
        }
    }
    
//MARK: - Initilazing
    init(viewModel: NewsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//MARK: - Setups
    private func setupViewController() {
        view.backgroundColor = #colorLiteral(red: 0.9724035859, green: 0.9314741492, blue: 0.9023552537, alpha: 1)
        navigationController?.navigationItem.title = "News"
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.5670369267, green: 0.8727459311, blue: 0.6660459638, alpha: 1)
        navigationItem.backButtonTitle = ""
        activityIndicator.startAnimating()
    }
    
    private func setupLayout() {
        view.addSubview(newsTableView)
        view.addSubview(activityIndicator)
        
        newsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    private func setupSearchBar() {
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
    }
    
    private func setupRefreshControl() {
        newsTableView.refreshControl = refreshControl
        refreshControl.addTarget(
            self,
            action: #selector(refreshNewsData),
            for: .valueChanged
        )
    }
    
    private func setupBarButtons() {
        let searchButton = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .done,
            target: self,
            action: #selector(didTapSearchButton)
        )
        
        let countryButton = UIBarButtonItem(
            image: UIImage(systemName: "globe.europe.africa"),
            style: .done,
            target: self,
            action: #selector(didTapCountryButton)
        )
        
        let topicButton = UIBarButtonItem(
            image: UIImage(systemName: "list.dash"),
            style: .done,
            target: self,
            action: #selector(didTapTopicButton)
        )
        
        navigationItem.leftBarButtonItem = searchButton
        navigationItem.rightBarButtonItems = [countryButton, topicButton]
    }
    
    private func setupNewsTableView() {
        newsTableView.dataSource = self
        newsTableView.delegate = self
        newsTableView.register(
            HeaderNewsTableViewCell.self,
            forCellReuseIdentifier: HeaderNewsTableViewCell.identifier)
        newsTableView.register(
            BaseHeaderCell.self,
            forCellReuseIdentifier: BaseHeaderCell.identifier)
        newsTableView.register(
            NewsTableViewCell.self,
            forCellReuseIdentifier: NewsTableViewCell.identifier)
        newsTableView.register(
            BaseCell.self,
            forCellReuseIdentifier: BaseCell.identifier)
    }
    
//MARK: - Actions
    
    @objc private func didTapSearchButton() {
        searchController.isActive = true
        searchController.searchBar.becomeFirstResponder()
    }
    
    @objc private func didTapCountryButton() {
        let countryPickerVC = CountryPickerViewController()
        countryPickerVC.delegate = self
        navigationController?.pushViewController(countryPickerVC, animated: true)
    }
    
    @objc private func didTapTopicButton() {
        let topicVC = TopicViewController()
        topicVC.delegate = self
        navigationController?.pushViewController(topicVC, animated: true)
    }
    
    @objc private func refreshNewsData() {
        isLoaded = !isLoaded
        newsTableView.reloadData()
        viewModel.getTopNews(country: viewModel.country)
        isSearching = false
    }
    
//MARK: - Biding
    
    private func setupBidings() {
        viewModel.title.bind { [weak self] title in
            DispatchQueue.main.async {
                self?.title = title
            }
        }
        
        viewModel.isLoading.bind { [weak self] isLoaded in
            DispatchQueue.main.async {
                if !isLoaded {
                    self?.activityIndicator.stopAnimating()
                } else {
                    self?.isLoaded = false
                    self?.newsTableView.reloadData()
                }
            }
        }
        
        viewModel.error.bind { [weak self] error in
            DispatchQueue.main.async {
                if let error = error {
                    let title = "Error Code : \(error.localizedDescription)"
                    let message = "Something went wronge, please check your network and try againg"
                    self?.setAlert(title: title, message: message)
                }
            }
        }
    }
}

//MARK: - Extensions
extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .header:
            return 1
        case .list:
            return viewModel.news.value.count - 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .header:
            if isLoaded {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderNewsTableViewCell.identifier, for: indexPath) as? HeaderNewsTableViewCell else { return UITableViewCell() }
                if let firstNews = viewModel.news.value.first {
                    cell.configure(with: firstNews)
                }
                return cell
                
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: BaseHeaderCell.identifier, for: indexPath) as? BaseHeaderCell else { return UITableViewCell() }
                if let firstNews = viewModel.news.value.first {
                    cell.configure(with: firstNews)
                }
                return cell
            }
            
        case .list:
            let news = viewModel.news.value[indexPath.row + 1]
            
            if isLoaded {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
                cell.configure(with: news)
                return cell
                
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: BaseCell.identifier, for: indexPath) as? BaseCell else { return UITableViewCell() }
                cell.configure(with: news)
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var news = viewModel.news.value[indexPath.row]
        
        switch indexPath.section {
        case 0:
            news = viewModel.news.value[indexPath.row]
        case 1:
            news = viewModel.news.value[indexPath.row + 1]
        default:
            break
        }
        
        let vc = SelectedNewsViewController(news: news)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
