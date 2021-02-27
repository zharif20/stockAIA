//
//  SecondInterfaces.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 27/02/2021.
//

import Foundation

protocol SecondDataPassing {
    
}

protocol SecondRoutingLogic {
    
}

protocol SecondWorkerLogic {
    func fetch(symbol: String, success: @escaping (SecondModel) -> Void, fail: @escaping (Error) -> Void)
}

protocol SecondDataStore {
    
}

protocol SecondBusinessLogic {
    func fetchItems(symbol: String)
}

protocol SecondPresentationLogic {
    func presentFetchResults(response: SecondModel)
    func presentFetchError(error: Error)
}

protocol SecondDisplayLogic: class {
    func successFetchedItems(viewModel: SecondModel)
    func errorFetchingItems(error: Error)
}
