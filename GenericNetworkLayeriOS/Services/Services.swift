//
//  Services.swift
//  GenericNetworkLayeriOS
//
//  Created by Yusuf Demirci on 13.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import Foundation

class Services {
    
    class func avgPrice(symbol: String, completion: @escaping(Swift.Result<AveragePriceResponseModel, ErrorModel>) -> Void) {
        ServiceManager.shared.sendRequest(request: AveragePriceRequestModel(symbol: symbol)) { (result) in
            completion(result)
        }
    }
}
