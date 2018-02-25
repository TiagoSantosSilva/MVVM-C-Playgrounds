//
//  SecondViewController.swift
//  MVVM-C Playgrounds - Animals
//
//  Created by Tiago Santos on 25/02/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: -
    
    @IBOutlet weak var emojiLabel: UILabel!
    
    // MARK: - Parameters
    
    var animal: Animal!
    
    // MARK: - Properties
    
    var viewModel: SecondViewModelRepresentable?
    
    // MARK: - Initialization
    
    convenience init(animal: Animal) {
        self.init()
        self.animal = animal
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setups
    
    func setupView() {
        DispatchQueue.main.async { [unowned self] in
            self.nameLabel.text = self.animal.name
            self.emojiLabel.text = self.animal.emoji
        }
    }
}

extension SecondViewController {
    @IBAction func didTapCloseButton(_ sender: Any) {
        viewModel?.done()
    }
}

extension SecondViewController: SecondViewModelViewDelegate {
    
}
