//
//  FirstViewController.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 27/02/2021.
//

import UIKit

class FirstViewController: UIViewController {

    var interactor: FirstBusinessLogic?
    
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
        let interactor = FirstInteractor()
        let presenter = FirstPresenter()

        interactor.presenter = presenter
        viewController.interactor = interactor
        presenter.viewController = viewController
    }

}

extension FirstViewController: FirstDisplayLogic {
    func successFetchedItems(viewModel: FirstModel) {
        print(viewModel)
    }
    
    func errorFetchingItems(error: Error) {
        print(error.localizedDescription)
    }
}
