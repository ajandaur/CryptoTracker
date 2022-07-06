//
//  NetworkManager.swift
//  CoinTracker
//
//  Created by Anmol  Jandaur on 5/25/22.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [Coin] = []
    
    var coinSubscription: AnyCancellable?
    
    
    init() {
        getCoins()
    }

    
    // MARK: - Using Combine to get coin data
    public func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        coinSubscription = NetworkManager.download(url: url)
            // we know data coming back is a CoinModel.. decode into our model
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
       

    }
    
}
