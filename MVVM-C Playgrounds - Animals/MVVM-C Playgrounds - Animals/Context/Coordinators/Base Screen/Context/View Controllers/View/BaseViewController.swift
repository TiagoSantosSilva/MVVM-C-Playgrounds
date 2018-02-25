//
//  BaseViewController.swift
//  MVVM-C Playgrounds - Animals
//
//  Created by Tiago Santos on 25/02/18.
//  Copyright © 2018 Tiago Santos. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: -
    
    var viewModel: BaseViewModelRepresentable?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BaseViewController {
    
    // MARK: - Cat Selected
    
    @IBAction func didSelectCat(_ sender: Any) {
        viewModel?.didSelectAnimal(animal: Animal(name: "Cat", emoji: "🐈"))
    }
    
    // MARK: - Frog Selected
    
    @IBAction func didSelectFrog(_ sender: Any) {
        viewModel?.didSelectAnimal(animal: Animal(name: "Frog", emoji: "🐸"))
    }
    
    // MARK: - Monkey Selected
    
    @IBAction func didSelectMonkey(_ sender: Any) {
        viewModel?.didSelectAnimal(animal: Animal(name: "Monkey", emoji: "🐒"))
    }
}

extension BaseViewController: BaseViewModelViewDelegate {
    
}
