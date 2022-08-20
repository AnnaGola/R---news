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
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch sections[indexPath.section] {
//        case .header:
//            if isLoaded {
//                guard let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: <#T##IndexPath#>)
//            }
//        }
//    }
//
    
}
