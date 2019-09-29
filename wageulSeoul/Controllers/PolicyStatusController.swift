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
        let api = API(endPoint: "/policy", token: "Bearer \(UserDefaults.standard.value(forKey: "token") as! String)")
        
        api.get()
        
        run(after: 1.0){
            print(api.data)
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
    
    func run(after wait: TimeInterval, closure: @escaping () -> Void) {
        let queue = DispatchQueue.main
        queue.asyncAfter(deadline: DispatchTime.now() + wait, execute: closure)
    }
    
}


