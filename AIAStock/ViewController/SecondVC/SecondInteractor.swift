//
//  SecondInteractor.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 27/02/2021.
//

import Foundation

class SecondInteractor: SecondBusinessLogic, SecondDataStore {
    var presenter: SecondPresentationLogic?
    var worker: SecondWorker?
    
    init() {
        worker = SecondWorker()
    }
    
    deinit {
        worker = nil
    }
    
    func fetchItems(symbol: String) {
        worker?.fetch(symbol: symbol, success: { [weak self] result in
            guard let strongSelf = self else { return }
            strongSelf.presenter?.presentFetchResults(response: result)
        }, fail: { [weak self] error in
            guard let strongSelf = self else { return }
            strongSelf.presenter?.presentFetchError(error: error)
        })
    }
}
