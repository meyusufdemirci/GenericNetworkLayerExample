//
//  TickerResponseModel.swift
//  GenericNetworkLayeriOS
//
//  Created by Yusuf Demirci on 13.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import Foundation

struct AveragePriceResponseModel: Codable {
    
    // MARK: - Properties
    var mins: Int?
    var price: String?
    
//    {"mins":5,"price":"6766.01484782"}
    
//    {
//        "symbol": "BTCUSDT",
//        "priceChange": "-352.42000000",
//        "priceChangePercent": "-4.948",
//        "weightedAvgPrice": "6776.81010754",
//        "prevClosePrice": "7123.35000000",
//        "lastPrice": "6770.76000000",
//        "lastQty": "0.05577400",
//        "bidPrice": "6770.76000000",
//        "bidQty": "0.10291600",
//        "askPrice": "6770.97000000",
//        "askQty": "0.18311700",
//        "openPrice": "7123.18000000",
//        "highPrice": "7159.86000000",
//        "lowPrice": "6575.00000000",
//        "volume": "100995.97896800",
//        "quoteVolume": "684430571.09118771",
//        "openTime": 1586719037780,
//        "closeTime": 1586805437780,
//        "firstId": 292697283,
//        "lastId": 293525174,
//        "count": 827892
//    }
}
