//
//  FirstModel.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 27/02/2021.
//

import Foundation

struct FirstModel {
    var companyStockPrice = [Price]()
    
    init(prices: [Price]){
        companyStockPrice = prices
    }
}
