//
//  NetworkManager.swift
//  CoinTracker
//
//  Created by Anmol  Jandaur on 5/25/22.
//

import Foundation
import Combine

class NetworkManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url): return "😭 Bad response from URL. \(url)"
            case .unknown: return "Unknown error occurred"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
        // go on background thread
//            .subscribe(on: DispatchQueue.global(qos: .default))
        // check that we have good data..
            .tryMap { try handleURLResponse(output: $0, url: url)}
        // will know that Publisher fails and if so, it will retry 3x
        // again, if this server gives a faulty response
            .retry(3)
        // takes publisher and conver it to AnyPublisher
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
    
}

