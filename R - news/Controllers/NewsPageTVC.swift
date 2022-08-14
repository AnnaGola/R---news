//
//  NewsPageTVC.swift
//  R - news
//
//  Created by anna on 14.08.2022.
//

import UIKit

class NewsPageTVC: UITableViewController {

    let news: [String] = ["anna", "ksusha"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NewsPageCell.identifier)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsPageCell.identifier, for: indexPath)
        return cell
    }
}
