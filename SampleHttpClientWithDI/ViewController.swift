//
//  ViewController.swift
//  SampleHttpClientWithDI
//
//  Created by Hüseyin Özer on 29/04/2017.
//  Copyright © 2017 Huseyin Ozer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    // Injected HttpClient
    var httpClient : HttpClient!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onClickSuccessRequest(_ sender: Any) {
        
        // Success request
        httpClient.get(path: "5904e13e10000015194f671f", onSuccess: { (result) in
            
            self.messageLabel.text = "Response : \(result ?? "")"
            
        }, onError: { (statusCode, errorMessage, error) in
            
            self.messageLabel.text = "StatusCode : \(statusCode) \nError Message : \(errorMessage ?? "")"
        })
    }
    
    @IBAction func onClickErrorRequest(_ sender: Any) {
        
        // Bad request
        httpClient.get(path: "5904e985100000a0194f6728", onSuccess: { (result) in
            
            self.messageLabel.text = "Response : \(result ?? "")"
            
        }) { (statusCode, errorMessage, error) in
            
            self.messageLabel.text = "StatusCode : \(statusCode) \nError Message : \(errorMessage ?? "")"
        }
    }
    
}

