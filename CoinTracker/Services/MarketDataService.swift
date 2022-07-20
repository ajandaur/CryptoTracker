//
//  MarketDataService.swift
//  CoinTracker
//
//  Created by Anmol  Jandaur on 6/7/22.
//

import Foundation

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData: MarketData? = nil
    
    var marketDataSubscription: AnyCancellable?
    
    
    init() {
        getData()
    }

    
    // MARK: - Using Combine to get coin data
    public func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        marketDataSubscription = NetworkManager.download(url: url)
            // we know data coming back is a CoinModel.. decode into our model
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedGlobalData in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
            })
       

    }
    
}
