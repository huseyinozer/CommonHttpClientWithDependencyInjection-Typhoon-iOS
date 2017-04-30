//
//  DefaultHttpClient.swift
//  SampleHttpClientWithDI
//
//  Created by Hüseyin Özer on 29/04/2017.
//  Copyright © 2017 Huseyin Ozer. All rights reserved.
//

import Foundation
import Alamofire

class DefaultHttpClient: NSObject, HttpClient {
    
    var baseUrl : String!
    
    init(baseUrl:String) {
        self.baseUrl = baseUrl;
    }
    
    func get(path: String, onSuccess: @escaping (String?) -> Void, onError: @escaping (Int, String?, Error) -> Void) {
        request(method: .get, path: path, params: [:], onSuccess: onSuccess, onError: onError)
    }
    
    func post(path: String, params: [String : String], onSuccess: @escaping (String?) -> Void, onError: @escaping (Int, String?, Error) -> Void) {
        request(method: .post, path: path, params: params, onSuccess: onSuccess, onError: onError)
    }
    
    func put(path: String, params: [String : String], onSuccess: @escaping (String?) -> Void, onError: @escaping (Int, String?, Error) -> Void) {
        request(method: .put, path: path, params: params, onSuccess: onSuccess, onError: onError)
    }
    
    func delete(path: String, params: [String : String], onSuccess: @escaping (String?) -> Void, onError: @escaping (Int, String?, Error) -> Void) {
        request(method: .delete, path: path, params: params, onSuccess: onSuccess, onError: onError)
    }
    
    private func request(method: HTTPMethod, path: String, params: [String : String], onSuccess: @escaping (String?) -> Void, onError: @escaping (Int, String?, Error) -> Void) {
        
        // Initialize url with path
        let url = baseUrl + path
        
        Alamofire.request(url, parameters: params)
            .validate()
            .responseString { (response) in
                
                switch response.result {
                    case .success:
                        onSuccess(response.result.value)
                    case .failure(let error):
                        
                        var statusCode : Int = -1
                        var errorMessage : String?
                        
                        if let _response = response.response {
                            statusCode = _response.statusCode
                        }
                        
                        if let _data = response.data, let _resposneText = String(data: _data, encoding: .utf8) {
                            errorMessage = _resposneText
                        }
                        
                        onError(statusCode, errorMessage, error)
                }
        }
    }
    
}
