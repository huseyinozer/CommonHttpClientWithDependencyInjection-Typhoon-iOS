//
//  AppAssembly.swift
//  SampleHttpClientWithDI
//
//  Created by Hüseyin Özer on 29/04/2017.
//  Copyright © 2017 Huseyin Ozer. All rights reserved.
//

import Foundation
import Typhoon

public class AppAssembly : TyphoonAssembly {
    
    public dynamic func viewController() -> Any {
        return TyphoonDefinition.withClass(ViewController.self) {
            (definition) in
            
            definition?.injectProperty(#selector(getter: ViewController.httpClient), with: self.httpClient())
            
            definition?.scope = TyphoonScope.singleton
            
        }
    }
    
    public dynamic func httpClient() -> Any {
        return TyphoonDefinition.withClass(DefaultHttpClient.self) {
            (definition) in
            
            definition?.useInitializer(Selector(("initWithBaseUrl:"))) {
                (initializer) in
                
                initializer?.injectParameter(with: "http://www.mocky.io/v2/")
                
            }
            
            definition?.scope = TyphoonScope.singleton
            
        }
    }
}
