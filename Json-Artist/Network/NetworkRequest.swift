//
//  NetworkRequest.swift
//  Json-Artist
//
//  Created by apple on 9/16/24.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    private init() {} 
    
    func requestData(completion: @escaping (Result<Data, Error>) -> Void) {
        let urlString = "https://cdn.accelonline.io/OUR6G_IgJkCvBg5qurB2Ag/files/YPHn3cnKEk2NutI6fHK04Q.json"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            DispatchQueue.main.async {
                if let error {
                    completion(.failure(error))
                } else {
                    guard let data else {return}
                    completion(.success(data))
                }
            }
        }
        .resume()
    }
}
