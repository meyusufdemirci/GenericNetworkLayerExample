//
//  String+Extension.swift
//  GenericNetworkLayeriOS
//
//  Created by Yusuf Demirci on 13.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import Foundation

extension String {
    
    func localized() -> String {
        return NSLocalizedString(self, comment: self)
    }
}
