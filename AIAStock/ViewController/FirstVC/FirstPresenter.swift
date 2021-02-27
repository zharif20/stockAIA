//
//  FirstPresenter.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 27/02/2021.
//

import Foundation

class FirstPresenter: FirstPresentationLogic {
    
    weak var viewController: FirstDisplayLogic?

    func presentFetchResults(response: FirstModel) {
        viewController?.successFetchedItems(viewModel: response)
    }
    
    func presentFetchError(error: Error) {
        viewController?.errorFetchingItems(error: error)
    }
    
}
