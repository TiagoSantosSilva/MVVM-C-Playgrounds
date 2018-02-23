//
//  ElementDetailsViewController.swift
//  MVVM-C Playgrounds
//
//  Created by Tiago Silva on 23/02/18.
//  Copyright © 2018 Tiago Silva. All rights reserved.
//

import UIKit

class ElementDetailsViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: -
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - View Model
    
    var viewModel: ElementDetailsViewModelRepresentable? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        
        didSet {
            viewModel?.viewDelegate = self
            refreshDisplay()
        }
    }
    
    // MARK: - Is Loaded
    
    fileprivate var isLoaded: Bool = false
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isLoaded = true
        refreshDisplay()
    }
    
    fileprivate func refreshDisplay() {
        guard isLoaded else { return }
        
        guard let viewModel = viewModel,
              let element = viewModel.element else {
                
                DispatchQueue.main.async { [unowned self] in
                    self.nameLabel.text = ""
                    self.descriptionLabel.text = ""
                }
            return
        }
        
        nameLabel.text = element.title
        descriptionLabel.text = element.description
    }
}

extension ElementDetailsViewController {
    
    // MARK: - Actions
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        viewModel?.done()
    }
}

extension ElementDetailsViewController: ElementDetailsViewModelDelegate {
    func detailsDidChange(viewModel: ElementDetailsViewModel) {
        refreshDisplay()
    }
}


