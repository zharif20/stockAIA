//
//  SecondPresenter.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 27/02/2021.
//

import Foundation

class SecondPresenter: SecondPresentationLogic {
    weak var viewController: SecondDisplayLogic?

    func presentFetchResults(response: SecondModel) {
        viewController?.successFetchedItems(viewModel: response)
    }
    
    func presentFetchError(error: Error) {
        viewController?.errorFetchingItems(error: error)
    }
}
