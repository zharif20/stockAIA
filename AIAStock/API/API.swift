//
//  API.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 28/02/2021.
//

import Foundation

public enum ErrorType: Error {
    case undefined
}

public enum Result<T> {
    case success(T)
    case failure(Error)
}

public class API {
    // MARK: - Properties
    
    public init() {}
    
    // MARK: - Methods
    
    public static func request(urlEndpoint: String, onResult: @escaping (Result<Any>) -> Void) {
        guard let myURL = urlEndpoint.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else { return }
        guard let url = URL(string: myURL) else { return }

        var dataTask: URLSessionDataTask?
        let defaultSession = URLSession(configuration: .default)
        
        dataTask?.cancel()
        
        dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data else { return }
            if let error = error {
                onResult(.failure(error))
            } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
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
