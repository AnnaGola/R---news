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
    
    
    
    
}
