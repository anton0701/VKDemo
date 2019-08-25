//
//  FeedTableViewDataSource.swift
//  VKDemo
//
//  Created by Anton Krylov on 25/08/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit

class FeedTableViewDataSource: NSObject {

    weak var output: FeedViewOutput?
    private let cellName = FeedTableViewCell.cellName
    private var feedCellModels = [FeedCellModel]()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            initialSetup()
        }
    }
    
    func setup(with feedItems: [FeedItem]) {
        
    }
}

// MARK: - Private functions
extension FeedTableViewDataSource {
    private func initialSetup() {
        tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension FeedTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedCellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as? FeedTableViewCell else {
            return UITableViewCell()
        }
        let feedCellModel = feedCellModels[indexPath.row]
        cell.setup(feedCellModel: feedCellModel)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension FeedTableViewDataSource: UITableViewDelegate {
    
}
