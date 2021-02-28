//
//  SecondModel.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 27/02/2021.
//

import Foundation

struct SecondModel {
    let companySymbol: String
    var companyStockPrice = [Price]()
    
    init(symbol: String, prices: [Price]){
        companySymbol = symbol
        companyStockPrice = prices
    }
}
