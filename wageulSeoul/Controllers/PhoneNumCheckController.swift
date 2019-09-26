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
        
        let api = API(endPoint: "/register", code: codeText.text!, phone: tempPhoneNum)
        api.post()
    }
    
    
}
