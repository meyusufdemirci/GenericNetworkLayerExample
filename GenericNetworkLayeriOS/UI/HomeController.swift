//
//  HomeController.swift
//  GenericNetworkLayeriOS
//
//  Created by Yusuf Demirci on 3.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Services.avgPrice(symbol: "BTCUSDT") { result in
            switch result {
            case Result.success(let response):
                // Handle successfull response
                break
            case Result.failure(let error):
                // Handle error
                break
            }
        }
    }
}
