//
//  AveragePriceRequestModel.swift
//  GenericNetworkLayeriOS
//
//  Created by Yusuf Demirci on 13.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import Foundation

class AveragePriceRequestModel: RequestModel {
    
    // MARK: - Properties
    private var symbol: String
    
    init(symbol: String) {
        self.symbol = symbol
    }
    
    override var path: String {
        return Constant.ServiceConstant.avgPrice
    }
    
    override var parameters: [String : Any?] {
        return [
            "symbol": symbol
        ]
    }
}
