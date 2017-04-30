//
//  HttpClient.swift
//  SampleHttpClientWithDI
//
//  Created by Hüseyin Özer on 29/04/2017.
//  Copyright © 2017 Huseyin Ozer. All rights reserved.
//

import Foundation

@objc
protocol HttpClient  {
    
    func get(path: String,  onSuccess: @escaping (_ result: String?) -> Void, onError: @escaping (_ statusCode: Int, _ message: String?, _ error: Error) -> Void) -> Void
    
    func post(path: String, params: [String:String], onSuccess: @escaping (_ result: String?) -> Void, onError: @escaping (_ statusCode: Int, _ message: String?, _ error: Error) -> Void) -> Void
    
    func put(path: String, params: [String:String], onSuccess: @escaping (_ result: String?) -> Void, onError: @escaping (_ statusCode: Int, _ message: String?, _ error: Error) -> Void) -> Void
    
    func delete(path: String, params: [String:String], onSuccess: @escaping (_ result: String?) -> Void, onError: @escaping (_ statusCode: Int, _ message: String?, _ error: Error) -> Void) -> Void
    
}
