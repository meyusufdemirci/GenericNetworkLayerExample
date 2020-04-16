//
//  ServiceManager.swift
//  GenericNetworkLayeriOS
//
//  Created by Yusuf Demirci on 13.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import Foundation

class ServiceManager {
    
    // MARK: - Properties
    public static let shared: ServiceManager = ServiceManager()
    
    public var baseURL: String = "https://api.binance.com/api/v3"
}

// MARK: - Public Functions
extension ServiceManager {
    
    func sendRequest<T: Codable>(request: RequestModel, completion: @escaping(ResponseModel<T>?, ErrorModel?) -> Void) {
        if request.isLoggingEnabled.0 {
            LogManager.req(request)
        }
        
        URLSession.shared.dataTask(with: request.urlRequest()) { data, response, error in
            guard let data = data, var responseModel = try? JSONDecoder().decode(ResponseModel<T>.self, from: data) else {
                let error: ErrorModel = ErrorModel(Error.parsing.rawValue)
                LogManager.err(error)

                completion(nil, error)
                return
            }
            
            if let json = String(data: data, encoding: String.Encoding.utf8) {
                responseModel.json = json
            }
            
            responseModel.request = request
            
            if request.isLoggingEnabled.1 {
                LogManager.res(responseModel)
            }
            
            completion(responseModel, nil)
        }.resume()
    }
}
