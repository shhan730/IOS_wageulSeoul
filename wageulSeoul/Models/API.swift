//
//  API.swift
//  wageulSeoul
//
//  Created by HSH on 26/09/2019.
//  Copyright © 2019 HSH. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class API{
    
    var tempURL = ""
    var endPoint = ""
    var phone = ""
    var token = ""
    var header:HTTPHeaders
    var body:[String:String] = [:]
    
    init(endPoint: String, authToken:String){
        self.endPoint = endPoint
        self.header = ["Content-Type":"application/x-www-form-urlencoded", "Accept":"application/json", "Authorization" : authToken]
    }
    
    init(endPoint: String, code: String, phone: String){
        self.endPoint = endPoint
        self.phone = phone
        self.header = ["Content-Type":"application/x-www-form-urlencoded", "Accept":"application/json"]
        self.body = [
            "phone": phone,
            "code": code
        ]
    }
    
    init(endPoint: String, phone: String){
        self.endPoint = endPoint
        self.phone = phone
        self.header = ["Content-Type":"application/x-www-form-urlencoded", "Accept":"application/json"]
        self.body = [
            "phone": phone,
        ]
    }
    
    init(endPoint: String, token: String){
        self.endPoint = endPoint
        self.token = token
        self.header = ["Content-Type":"application/x-www-form-urlencoded", "Accept":"application/json", "Authorization" : self.token]
    }
    
    func get(complete:@escaping (_ returns: NSDictionary) -> Void){
        let url = URL(string: "https://wageul.heewon.dev/api\(self.endPoint)")!
        print(url)
        Alamofire.request(url, method: .get, parameters: [:], encoding: URLEncoding.default, headers: self.header)
            .responseJSON { (response) in
            if response.result.value != nil
            {
                complete(response.result.value as! NSDictionary)
            }
        }
    }
    
    func post(complete:@escaping (_ returns: NSDictionary) -> Void){
        let url = URL(string: "https://wageul.heewon.dev/api\(self.endPoint)")!
        Alamofire.request(url, method: .post, parameters: self.body, headers: header)
            .responseJSON { (response) in
            if response.result.value != nil
            {
                complete(response.result.value as! NSDictionary)
            }
        }
    }
    
    func delete(complete:@escaping (_ returns: NSDictionary) -> Void){
        let url = URL(string: "https://wageul.heewon.dev/api\(self.endPoint)")!
        Alamofire.request(url, method: .delete, parameters: self.body, headers: header)
            .responseJSON { (response) in
            if response.result.value != nil
            {
                complete(response.result.value as! NSDictionary)
            }
        }
    }
    
    func set(complete:@escaping (_ returns: NSDictionary) -> Void){
        let url = URL(string: "https://wageul.heewon.dev/api\(self.endPoint)")!
        Alamofire.request(url, method: .put, parameters: self.body, headers: header)
            .responseJSON { (response) in
            if response.result.value != nil
            {
                complete(response.result.value as! NSDictionary)
            }
        }
    }
    
}
