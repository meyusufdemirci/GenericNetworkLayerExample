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
}
