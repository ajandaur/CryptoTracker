//
//  MarketData.swift
//  CoinTracker
//
//  Created by Anmol  Jandaur on 6/7/22.
//

import Foundation

struct GlobalData: Codable {
    let data: MarketData?
}

struct MarketData: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
    
}



/*
 URL: https://api.coingecko.com/api/v3/global
 
 JSON DATA:
 
 {
   "data": {
     "active_cryptocurrencies": 13497,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 636,
     "total_market_cap": {
       "btc": 42882257.943142034,
       "eth": 716430653.980874,
       "ltc": 20535031230.947247,
       "bch": 7218203056.8215475,
       "bnb": 4504841623.266237,
       "eos": 1015868654064.6388,
       "xrp": 3194676274782.794,
       "xlm": 9249225517511.04,
       "link": 157898990100.89917,
       "dot": 140462031640.57645,
       "yfi": 170737955.8609976,
       "usd": 1294936041726.2126,
       "aed": 4756287131899.964,
       "ars": 157064473327954.72,
       "aud": 1790786476143.8071,
       "bdt": 119765443776850.86,
       "bhd": 488159809265.78033,
       "bmd": 1294936041726.2126,
       "brl": 6304784599956.606,
       "cad": 1622324361667.5168,
       "chf": 1258869483092.0566,
       "clp": 1073825712601462.4,
       "cny": 8637611879126.367,
       "czk": 29935942931814.09,
       "dkk": 8996191323504.738,
       "eur": 1209430119954.9907,
       "gbp": 1028851288936.2687,
       "hkd": 10160210626348.477,
       "huf": 469969846572459.3,
       "idr": 18728077250267456,
       "ils": 4330544534781.419,
       "inr": 100580650354282.78,
       "jpy": 171627369803297.9,
       "krw": 1624898694518471.8,
       "kwd": 396484812191.7737,
       "lkr": 468144078694087.94,
       "mmk": 2397902603939996,
       "mxn": 25356011844500.758,
       "myr": 5691891371407.582,
       "ngn": 537566799001804.1,
       "nok": 12244516370262.24,
       "nzd": 1995188245522.1624,
       "php": 68385578838241.5,
       "pkr": 258177873319163.9,
       "pln": 5539362149988.703,
       "rub": 80447900297305.06,
       "sar": 4857757025193.603,
       "sek": 12670770467117.254,
       "sgd": 1778892488600.5525,
       "thb": 44578173236424.86,
       "try": 21697171353539.406,
       "twd": 38212268950234.87,
       "uah": 38266771513295.07,
       "vef": 129661945858.04561,
       "vnd": 30030985885306124,
       "zar": 19901676489947.89,
       "xdr": 942163090558.9514,
       "xag": 58211803756.85591,
       "xau": 698462602.1862856,
       "bits": 42882257943142.03,
       "sats": 4288225794314203.5
     },
     "total_volume": {
       "btc": 2686215.472882455,
       "eth": 44878399.60578602,
       "ltc": 1286348277.225376,
       "bch": 452160162.91283876,
       "bnb": 282190720.63200295,
       "eos": 63635690559.55269,
       "xrp": 200119798998.23438,
       "xlm": 579386764807.4907,
       "link": 9891053566.347511,
       "dot": 8798773685.0448,
       "yfi": 10695307.589685386,
       "usd": 81116932701.87071,
       "aed": 297941682644.6442,
       "ars": 9838778057188.559,
       "aud": 112177822987.40765,
       "bdt": 7502305233473.86,
       "bhd": 30579136822.220387,
       "bmd": 81116932701.87071,
       "brl": 394942121938.8695,
       "cad": 101625077861.42305,
       "chf": 78857663892.25836,
       "clp": 67266216443026.32,
       "cny": 541074276201.28894,
       "czk": 1875236915122.038,
       "dkk": 563536284918.8317,
       "eur": 75760700518.63359,
       "gbp": 64448944253.35761,
       "hkd": 636452376841.4762,
       "huf": 29439687511907.945,
       "idr": 1173157695047441.5,
       "ils": 271272463095.5861,
       "inr": 6300538082964.064,
       "jpy": 10751021948215.02,
       "krw": 101786338323634.56,
       "kwd": 24836463571.591484,
       "lkr": 29325318396100.754,
       "mmk": 150208580101106.2,
       "mxn": 1588342466425.1277,
       "myr": 356549477691.0736,
       "ngn": 33674072272527.68,
       "nok": 767016731613.6188,
       "nzd": 124981887463.59969,
       "php": 4283785621570.4556,
       "pkr": 16172688457435.49,
       "pln": 346994795305.0536,
       "rub": 5039389362986.795,
       "sar": 304297924374.231,
       "sek": 793717992351.0934,
       "sgd": 111432763960.541,
       "thb": 2792450408261.8984,
       "try": 1359146654192.9258,
       "twd": 2393679648216.4365,
       "uah": 2397093778796.925,
       "vef": 8122238471.43831,
       "vnd": 1881190562726071.8,
       "zar": 1246673890038.2146,
       "xdr": 59018652310.56372,
       "xag": 3646483544.8589253,
       "xau": 43752851.160735086,
       "bits": 2686215472882.455,
       "sats": 268621547288245.53
     },
     "market_cap_percentage": {
       "btc": 44.449602036518556,
       "eth": 16.88206345574755,
       "usdt": 5.590434619940803,
       "usdc": 4.159325636866549,
       "bnb": 3.626459021555746,
       "ada": 1.6264645831759275,
       "xrp": 1.4995910949484164,
       "busd": 1.4043774669842313,
       "sol": 1.041861872265044,
       "doge": 0.8307618070214329
     },
     "market_cap_change_percentage_24h_usd": -2.5292595208985205,
     "updated_at": 1654628348
   }
 }
 
 */

