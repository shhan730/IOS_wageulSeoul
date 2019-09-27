//
//  IDVerificationController.swift
//  wageulSeoul
//
//  Created by HSH on 08/09/2019.
//  Copyright © 2019 HSH. All rights reserved.
//

import Foundation
import UIKit

class IDVerificationController: UIViewController {
    
    @IBOutlet weak var phoneNum: UITextField!
    
    
    @IBAction func sendPhoneNum(_ sender: UIButton) {
        
        UserDefaults.standard.set(phoneNum.text!,forKey: "tempPhoneNum")
        
        let api = API(endPoint: "/sms/code", phone: phoneNum.text!)
       api.post()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}
