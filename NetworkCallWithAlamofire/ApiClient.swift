//
//  ApiClient.swift
//  CinchProject
//
//  Created by Mariam on 26/10/2020.
//  Copyright © 2020 Decagon. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    enum HttpMethodType: String {
        case get, post, patch, delete, put
    }
    func execute <DataModel: Decodable> (requestType: HttpMethodType = .get, url: String, params: [String: String] = [:],
                                         success: @escaping (DataModel) -> (), failure: @escaping (String) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async { [self] in
            let convertedHttpMethod = httpMethodConversion(httpMethod: requestType)
            AF.request(url, method: convertedHttpMethod, parameters: params)
                .validate(statusCode: 200 ..< 299).responseDecodable(of: DataModel.self) { response in
                    if let error = response.error {
                        failure(error.localizedDescription)
                        return
                    }
                    if let result = response.value {
                        success(result)
                        return
                    }
                }
        }
    }
    // This function converts httpMethodType enum (business logic) to Alamofire httpmethod
    private func httpMethodConversion(httpMethod: HttpMethodType) -> HTTPMethod {
        let requestTypeRawValue = httpMethod.rawValue
        let convertedHttpMethod = HTTPMethod(rawValue: requestTypeRawValue)
        return convertedHttpMethod
    }
}
