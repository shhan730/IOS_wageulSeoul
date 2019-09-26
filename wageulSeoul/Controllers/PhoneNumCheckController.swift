//
//  PhoneNumCheckController.swift
//  wageulSeoul
//
//  Created by HSH on 20/09/2019.
//  Copyright © 2019 HSH. All rights reserved.
//

import Foundation
import UIKit
class PhoneNumCheckController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var codeText: UITextField!
    
    @IBAction func phoneNumCheckButton(_ sender: UIButton) {
        
        let tempPhoneNum = UserDefaults.standard.value(forKey: "tempPhoneNum") as! String
        
        let message = Message(phone: tempPhoneNum, code:codeText.text!)
        
        let postRequest = APIRequest(endPoint: "/register")
        postRequest.save(message, completion: { result in
            switch result{
            case .success(let messege):
                print("Messege Sent: \(messege)")
            case .failure(let error):
                print("Error Occured: \(error)")
            }
        })
    }
    
    
}
