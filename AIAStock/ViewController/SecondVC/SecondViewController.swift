//
//  SecondViewController.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 27/02/2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    var interactor: SecondBusinessLogic?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.fetchItems(symbol: "IBM")
    }

    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = SecondInteractor()
        let presenter = SecondPresenter()

        interactor.presenter = presenter
        viewController.interactor = interactor
        presenter.viewController = viewController
    }
}

extension SecondViewController: SecondDisplayLogic {
    func successFetchedItems(viewModel: SecondModel) {
        print("viewmodel____ : \(viewModel)")
    }
    
    func errorFetchingItems(error: Error) {
        
    }
}
