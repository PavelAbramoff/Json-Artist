//
//  NetworkDataFetch.swift
//  Json-Artist
//
//  Created by apple on 9/16/24.
//
import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    private init() {}
        
        func fetchData(responce: @escaping (ArtistModel?, Error?) -> Void) {
            
            NetworkRequest.shared.requestData { result in
                switch result {
                case .success(let data):
                    do {
                        let artistModel = try JSONDecoder().decode(ArtistModel.self, from: data)
                        responce(artistModel, nil)
                    } catch let jsonError {
                        print("Failed to decode JSON", jsonError)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    responce(nil, error)
            }
        }
    }
}
