//
//  APIWorker.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 27/02/2021.
//

import Foundation

public class APIWorker {
    
    // MARK: - Methods
    
    public static func fetchIntraDay(symbol: String = "IBM", success: @escaping (AnyObject) -> Void, fail: @escaping (Error) -> Void) {
        let interval: String = Storage.loadItem(key: .interval) ?? "5min"
        let outputSize: String = Storage.loadItem(key: .outputSize) ?? "compact"

        API.request(urlEndpoint: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=\(symbol)&interval=\(interval)&outputsize=\(outputSize)") { result in
            switch result {
            case .success(let data):
                do {
                    if let data = data as? Data {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as AnyObject
                        success(json)
                    }
                } catch let error {
                    fail(error)
                }
            case .failure(let error):
                fail(error)
            }
        }
    }
    
    public static func fetchDailyAdjusted(symbol: String = "IBM", success: @escaping (AnyObject) -> Void, fail: @escaping (Error) -> Void) {
        let outputSize: String = Storage.loadItem(key: .outputSize) ?? "compact"

        API.request(urlEndpoint: "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=\(symbol)&outputsize=\(outputSize)") { result in
            switch result {
            case .success(let data):
                do {
                    if let data = data as? Data {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as AnyObject
                        success(json)
                    }
                } catch let error {
                    fail(error)
                }
            case .failure(let error):
                fail(error)
            }
        }
    }
}
