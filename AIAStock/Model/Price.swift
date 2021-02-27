//
//  Price.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 28/02/2021.
//

import Foundation

struct Price {
    let dailyDate: String
    let dailyOpen: Double
    let dailyHigh: Double
    let dailyLow: Double
    let dailyClose: Double
    let dailyVolume: Int
    let adjustedClose: Double?
    let dividenAmount: Double?
    let splitCoefficient: Double?
    
    init(date: String, open: Double, high: Double, low: Double, close: Double, volume: Int, adjClose: Double? = nil, divAmount: Double? = nil, splitCoef: Double? = nil){
        dailyDate = date
        dailyOpen = open
        dailyHigh = high
        dailyLow = low
        dailyClose = close
        dailyVolume = volume
        adjustedClose = adjClose
        dividenAmount = divAmount
        splitCoefficient = splitCoef
    }
}
