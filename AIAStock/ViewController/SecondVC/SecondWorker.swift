//
//  SecondWorker.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 27/02/2021.
//

import Foundation

class SecondWorker: SecondWorkerLogic {
    func fetch(symbol: String, success: @escaping (SecondModel) -> Void, fail: @escaping (Error) -> Void) {
        var arrangeDate = [[String]]()
        let dateFormater = DateFormatter()
        
        dateFormater.dateFormat = "yyyy/MM/dd"
        
        APIWorker.fetchDailyAdjusted(symbol: symbol) { result in

            if let prices = result["Time Series (Daily)"] as? NSDictionary{
                guard let priceArray = prices as? [String: AnyObject] else { return }
                for (key, value) in priceArray{
                    guard let open = value["1. open"] as? String else { return }
                    guard let high = value["2. high"] as? String else { return }
                    guard let low = value["3. low"] as? String else { return }
                    guard let close = value["4. close"] as? String else { return }
                    guard let adjustedClose = value["5. adjusted close"] as? String else { return }
                    guard let volume = value["6. volume"] as? String else { return }
                    guard let dividenAmount = value["7. dividend amount"] as? String else { return }
                    guard let splitCoefficient = value["8. split coefficient"] as? String else { return }
                    arrangeDate.append([key, open, high, low, close, adjustedClose, volume, dividenAmount, splitCoefficient])
                }
            }
            
            let sortedArray = arrangeDate.sorted(by: {left, right in
                let leftDate = dateFormater.date(from: left[0])
                let rightDate = dateFormater.date(from: right[0])
                return leftDate?.compare(rightDate!) == .orderedAscending
            })
            
            var finalArray = [Price]()
            for data in sortedArray{
                finalArray.append(Price(date: data[0], open: Double(data[1])!, high: Double(data[2])!, low: Double(data[3])!, close: Double(data[4])!, volume: Int(data[6])!, adjClose: Double(data[5])!, divAmount: Double(data[7])!, splitCoef: Double(data[8])!))
            }
            
            success(SecondModel(prices: finalArray))
            
        } fail: { error in
            fail(error)
        }
    }
}
