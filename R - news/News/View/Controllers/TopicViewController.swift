//
//  TopicViewController.swift
//  R - news
//
//  Created by anna on 20.08.2022.
//

import Foundation
import SnapKit

protocol TopicViewControllerDelegate: AnyObject {
    func setTopic(with topic: String)
}

final class TopicViewController: UIViewController {

//MARK: - Properties
    weak var delegate: TopicViewControllerDelegate?
    private lazy var topics = Constants.topics
    private lazy var topicsTableView = UITableView()
    
//MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupTopicTable()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topicsTableView.animate()
    }
    
//MARK: - Setups
    private func setupViewController() {
        view.backgroundColor = .secondarySystemBackground
        navigationItem.title = "Choose a Topic"
    }
    
    private func setupTopicTable() {
        view.addSubview(topicsTableView)
        topicsTableView.rowHeight = Constants.heightForCell / 1.3
        topicsTableView.dataSource = self
        topicsTableView.delegate = self
        
        topicsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        topicsTableView.backgroundColor = .secondarySystemBackground
        
        topicsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupCloseButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(closeButtonTapped))
    }
    
    @objc private func closeButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Topic extension
extension TopicViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = topicsTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = Constants.topics[indexPath.row]
        cell.textLabel?.textAlignment = .left
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        topicsTableView.deselectRow(at: indexPath, animated: true)
        delegate?.setTopic(with: Constants.topics[indexPath.row])
        closeButtonTapped()
    }
}
