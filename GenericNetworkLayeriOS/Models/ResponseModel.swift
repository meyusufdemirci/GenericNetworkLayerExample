//
//  ResponseModel.swift
//  GenericNetworkLayeriOS
//
//  Created by Yusuf Demirci on 13.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import Foundation

struct ResponseModel<T: Codable>: Codable {
    
    // MARK: - Properties
    var isSuccess: Bool
    var message: String
    var data: T?
    var json: String?
    var request: RequestModel?
    
    public init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        isSuccess = (try? keyedContainer.decode(Bool.self, forKey: CodingKeys.isSuccess)) ?? false
        message = (try? keyedContainer.decode(String.self, forKey: CodingKeys.message)) ?? ""
        data = try? keyedContainer.decode(T.self, forKey: CodingKeys.data)
    }
}

// MARK: - Public Functions
extension ResponseModel {
    
    func error() -> ErrorModel {
        return ErrorModel(message)
    }
}

// MARK: - Private Functions
extension ResponseModel {

    private enum CodingKeys: String, CodingKey {
        case isSuccess
        case message
        case data
    }
}
