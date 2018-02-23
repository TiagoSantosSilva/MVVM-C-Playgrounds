//
//  ElementListViewController.swift
//  MVVM-C Playgrounds
//
//  Created by Tiago Silva on 23/02/18.
//  Copyright © 2018 Tiago Silva. All rights reserved.
//

import UIKit

class ElementListViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var viewModel: ElementListViewModel? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        
        didSet {
            viewModel?.viewDelegate = self
        }
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        refreshDisplay()
    }
    
    // MARK: -
    
    func setupView() {
        setupDelegates()
    }
    
    // MARK: -
    
    func setupDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ElementListViewController {
    func refreshDisplay() {
        guard let viewModel = viewModel else {
            title = ""
            return
        }
        
        title = viewModel.title
        tableView.reloadData()
    }
}

// MARK: - Table View Data Source

extension ElementListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Element"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

// MARK: - Table View Delegate

extension ElementListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.useItemAtIndex(indexPath.row)
    }
}

// MARK: - Element List View Model Delegate

extension ElementListViewController: ElementListViewModelDelegate {
    func itemsDidChange(viewModel: ElementListViewModel) {
        tableView.reloadData()
    }
}
