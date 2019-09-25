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
        let messege = Messege(phone: phoneNum.text!)
        //print(phoneNum.text!)
        let postRequest = APIRequest(endPoint: "/sms/code")
        postRequest.save(messege, completion: { result in
            switch result{
            case .success(let messege):
                print("Messege Sent: \(messege)")
            case .failure(let error):
                print("Error Occured: \(error)")
            }
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}
