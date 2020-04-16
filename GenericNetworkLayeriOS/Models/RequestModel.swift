//
//  RequestModel.swift
//  GenericNetworkLayeriOS
//
//  Created by Yusuf Demirci on 13.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

enum RequestHTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

class RequestModel: NSObject {
    
    // MARK: - Properties
    var path: String {
        return ""
    }
    var parameters: [String: Any?] {
        return [:]
    }
    var headers: [String: String] {
        return [:]
    }
    var method: RequestHTTPMethod {
        return body.isEmpty ? RequestHTTPMethod.get : RequestHTTPMethod.post
    }
    var body: [String: Any?] {
        return [:]
    }
    // (request, response)
    var isLoggingEnabled: (Bool, Bool) {
        return (true, true)
    }
}

// MARK: - Public Functions
extension RequestModel {
    
    func urlRequest() -> URLRequest {
        var endpoint: String = ServiceManager.shared.baseURL.appending(path)
        
        for parameter in parameters {
            if let value = parameter.value as? String {
                endpoint.append("?\(parameter.key)=\(value)")
            }
        }
        
        var request: URLRequest = URLRequest(url: URL(string: endpoint)!)
        
        request.httpMethod = method.rawValue
        
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        if method == RequestHTTPMethod.post {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body, options: JSONSerialization.WritingOptions.prettyPrinted)
            } catch let error {
                LogManager.e("Request body parse error: \(error.localizedDescription)")
            }
        }
        
        return request
    }
}
