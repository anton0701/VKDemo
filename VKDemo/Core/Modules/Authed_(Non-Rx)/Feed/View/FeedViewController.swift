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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        presenter?.viewLoaded()
    }
    
    
    private func setupTableView() {
        tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension FeedViewController: FeedViewInput {
    func setup() {
        
    }
}

extension FeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath)
        return cell
    }
}

extension FeedViewController: UITableViewDelegate {
    
}
