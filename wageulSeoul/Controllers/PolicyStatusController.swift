//
//  PolicyStatusController.swift
//  wageulSeoul
//
//  Created by HSH on 08/09/2019.
//  Copyright © 2019 HSH. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class PolicyStatusController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://wageul.heewon.dev/api/policy", method: .get, parameters: [:], encoding: URLEncoding.default, headers: ["Content-Type":"application/json", "Accept":"application/json", "Authorization" : "Bearer \(UserDefaults.standard.value(forKey: "token") as! String)"])
                    .validate(statusCode: 200..<401)
                    .responseJSON { (response) in
                    if let JSON = response.result.value
                    {
                        print(JSON)
                        
                    }
                }


    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
