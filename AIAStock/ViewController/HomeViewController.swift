//
//  ViewController.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 27/02/2021.
// Alpha API key: GACKQN6MJLZNACFL

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        APIWorker.request(urlEndpoint: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=GACKQN6MJLZNACFL") { result in
            switch result {
            case .success(let data):
                if let resData = data as? Data {
                    let jsonResponse = try? JSONSerialization.jsonObject(with: resData, options: [])
                    
                    if let response = jsonResponse as? [String: Any] {
                        print("RESPONSE: \(response)")
                    } else {
                        print("SOMETHING WENT WRONG")
                    }
                }
            case .failure(_):
                print("fal")
            }
        }
    }


}

