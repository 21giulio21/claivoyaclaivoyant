//
//  Util.swift
//  finalChatGiulioTavella
//
//  Created by iMac i7 32Gb ram on 21/08/17.
//  Copyright © 2017 Giulio Tavella. All rights reserved.
//

import Foundation
import Alamofire




func connessioneAlServerPerMandareMessaggio(completition:@escaping(String)->(),numero:String)
{

    let parametri = ["NUMERO":numero,"CODICE_APP":"claivoyant.3279556588"]
    print("numero a cui mando la richiesta:\(numero)")
    Alamofire.request(AppDelegate.urlServerPerMandareMessaggio, parameters: parametri, encoding: URLEncoding.default).responseData { (response) in
        print("Request: \(String(describing: response.request))")   // original url request
        print("Response: \(String(describing: response.response))") // http url response
        print("Result: \(response.result)")
        
        
        if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
            print("Data: \(utf8Text)") // original server data as UTF8 string
        }
    
        return completition("ciao")
    }




    
}
