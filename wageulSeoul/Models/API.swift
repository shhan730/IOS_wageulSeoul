//
//  API.swift
//  wageulSeoul
//
//  Created by HSH on 26/09/2019.
//  Copyright © 2019 HSH. All rights reserved.
//

import Foundation
import UIKit

class API{
    
    var tempURL = ""
    var jsonObj: Dictionary<String,String>
    var endPoint = ""
    var phone = ""
    
    init(endPoint: String, code: String, phone: String){
        self.tempURL = "https://wageul.heewon.dev/api\(endPoint)"
        self.endPoint = endPoint
        self.phone = phone
        jsonObj = [
            "phone" : phone,
            "code" : code
        ]
    }
    
    init(endPoint: String, phone: String){
        self.tempURL = "https://wageul.heewon.dev/api\(endPoint)"
        self.endPoint = endPoint
        self.phone = phone
        jsonObj = [
            "phone" : phone,
        ]
    }
    
    func post(){
        let url = URL(string: tempURL)!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = try! JSONSerialization.data(withJSONObject: jsonObj, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            var responseCode: Int = 0
            
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)\n")
                    responseCode = response.statusCode
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)\n")
                }
                //print(self.endPoint)
                if self.endPoint == "/register"{
                    //print("1")
                    self.RegisterCheck(responseCode: responseCode)
                    
                    if responseCode == 200{
                        print("register Sucess")
                        UserDefaults.standard.set(self.phone,forKey: "FinalPhoneNum")
                        
                    }else if responseCode == 400{
                        print("register Fail")
                    }
                    
                    //end
                }else if self.endPoint == "/login"{
                    self.LoginCheck(responseCode: responseCode)
                }
                
            }
        }
        task.resume()
        
    }
    
    func RegisterCheck(responseCode: Int){
        
    }
    
    func LoginCheck(responseCode: Int){
        if responseCode == 200{
            UserDefaults.standard.set(true,forKey: "Authorized")
        }else if responseCode == 500{
            UserDefaults.standard.set(false,forKey: "Authorized")
        }
    }
    
}
