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
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var codeText: UITextField!
    
    @IBAction func phoneNumCheckButton(_ sender: UIButton) {
        
        let tempPhoneNum = UserDefaults.standard.value(forKey: "tempPhoneNum") as! String
        
        let api = API(endPoint: "/register", code: codeText.text!, phone: tempPhoneNum)
        
        api.post()
        
        // Delay for 2 seconds, then run the code between the braces.
        let secondsToDelay = 0.2
        run(after: secondsToDelay) {
            // This code will run after the delay
            //Login Test
            if (UserDefaults.standard.value(forKey: "FinalPhoneNum") as? String) != nil{
                print("Sucess")
                self.switchToMainUI()
            }else{
                print("fail")
                self.registerFail()
            }
        }
        
    }
    
    func switchToMainUI() {
        // window 제작
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // StoryBoard Instance
        let tutorialStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        // View Controller Instance
        let viewController = tutorialStoryboard.instantiateViewController(withIdentifier: "policy")
        
        // Set Root View Controller of Window
        self.window?.rootViewController = viewController
        
        // Show Window
        self.window?.makeKeyAndVisible()
    }
    
    func registerFail(){
        let alert = UIAlertController(title: "계정가입 오류발생", message: "입력하신 핸드폰번호와 인증코드를 확인해주세요.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))

        self.present(alert, animated: true)
        
    }
    
    func run(after wait: TimeInterval, closure: @escaping () -> Void) {
        let queue = DispatchQueue.main
        queue.asyncAfter(deadline: DispatchTime.now() + wait, execute: closure)
    }
    
}
