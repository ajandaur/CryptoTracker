//
//  CoinImageService.swift
//  CoinTracker
//
//  Created by Anmol  Jandaur on 5/26/22.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: Coin
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: Coin) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
            // get from FileManager
        if let savedImage = fileManager.getImage(imageName: imageName, FolderName: folderName) {
            image = savedImage
            print("Retrieved image from File Manager")
        } else {
            downloadCoinImage()
            print("Downloading image now..")
        }
    }
    
    private func downloadCoinImage() {
        print("Downloading image now..")
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkManager.download(url: url)
            // we know data coming back is a CoinModel.. decode into our model
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImages(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
