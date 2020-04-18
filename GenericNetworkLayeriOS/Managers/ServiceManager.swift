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
    
    func sendRequest<T: Codable>(request: RequestModel, completion: @escaping(Swift.Result<T, ErrorModel>) -> Void) {
        if request.isLoggingEnabled.0 {
            LogManager.req(request)
        }
        
        /// Comment for rest service
        let data = try! Data(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "Response", ofType: "json")!), options: NSData.ReadingOptions.mappedIfSafe)
        
        /// Uncomment for rest service
//        URLSession.shared.dataTask(with: request.urlRequest()) { data, response, error in
//            guard let data = data, var responseModel = try? JSONDecoder().decode(ResponseModel<T>.self, from: data) else {
            guard var responseModel = try? JSONDecoder().decode(ResponseModel<T>.self, from: data) else {
                let error: ErrorModel = ErrorModel(ErrorKey.parsing.rawValue)
                LogManager.err(error)

                completion(Result.failure(error))
                return
            }

            responseModel.rawData = data
            responseModel.request = request

            if request.isLoggingEnabled.1 {
                LogManager.res(responseModel)
            }

            completion(Result.success(responseModel.data!))
        /// Uncomment for rest service
//        }.resume()
    }
}
