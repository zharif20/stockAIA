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
    
    init(date: String, open: Double, high: Double, low: Double, close: Double, volume: Int){
        dailyDate = date
        dailyOpen = open
        dailyHigh = high
        dailyLow = low
        dailyClose = close
        dailyVolume = volume
    }
}
