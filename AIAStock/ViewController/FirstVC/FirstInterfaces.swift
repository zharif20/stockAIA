//
//  FirstInterfaces.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 27/02/2021.
//

import Foundation

protocol FirstDataPassing {
    
}

protocol FirstRoutingLogic {
    
}

protocol FirstWorkerLogic {
    func fetch(symbol: String, success: @escaping (FirstModel) -> Void, fail: @escaping (Error) -> Void)
}

protocol FirstDataStore {
    
}

protocol FirstBusinessLogic {
    func fetchItems(symbol: String)
}

protocol FirstPresentationLogic {
    func presentFetchResults(response: FirstModel)
    func presentFetchError(error: Error)
}

protocol FirstDisplayLogic: class {
    func successFetchedItems(viewModel: FirstModel)
    func errorFetchingItems(error: Error)
}
