//
//  APIWorker.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 27/02/2021.
//

import Foundation

public enum ErrorType: Error {
    case undefined
}

public enum Result<T> {
    case success(T)
    case failure(Error)
}

public class APIWorker {
    
    // MARK: - Properties
    
    public init() {}
    
    // MARK: - Methods
    
    public static func request(urlEndpoint: String, onResult: @escaping (Result<Any>) -> Void) {
        guard let url = URL(string: urlEndpoint) else { return }

        var dataTask: URLSessionDataTask?
        let defaultSession = URLSession(configuration: .default)
        
        dataTask?.cancel()
        
        dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in

            if let error = error {
                onResult(.failure(error))
            } else if
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                DispatchQueue.main.async {
                    onResult(.success(data))
                }
            } else {
                onResult(.success(ErrorType.undefined))
            }
        })
        
        dataTask?.resume()
    }
}
