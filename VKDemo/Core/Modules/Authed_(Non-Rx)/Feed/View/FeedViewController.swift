//
//  FeedViewController.swift
//  VKDemo
//
//  Created by AntonKrylovBrightBox on 10/06/2019.
//  Copyright © 2019 BrightBox. All rights reserved.
//

import UIKit

class FeedViewController: BaseViewController, ViperModuleTransitionHandler {
    var presenter: FeedViewOutput?
    
    private let cellName = FeedTableViewCell.cellName
    
    @IBOutlet weak var tableView: UITableView!
    
    var feedItems = [FeedItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        
        presenter?.viewLoaded()
    }
    
    
    private func setupTableView() {
        tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupAppearance() {
        setupTableView()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension FeedViewController: FeedViewInput {
    func setup(feedItems: [FeedItem]) {
        self.feedItems = feedItems
        tableView.reloadData()
    }
}

extension FeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as? FeedTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(text: "IUH uihwdfiuahsd ihIUh iasufhd iasuhd iausdh iah iuhi ufh iweufhiweufhi 2u3hriu 23h4ih23i4 h2i3u4h5 2i3u5h i23h5i23h45i2u34h i23h4i23h4 i23h4 i23h4i 2uh34iu2h34 iuh234i u2h34i uh23i4u h2i3u4 hdsfsdf ererer.")
        cell.layoutIfNeeded()
        return cell
    }
}

extension FeedViewController: UITableViewDelegate {
    
}
