//
//  PolicyStatusController.swift
//  wageulSeoul
//
//  Created by HSH on 08/09/2019.
//  Copyright © 2019 HSH. All rights reserved.
//

import Foundation
import UIKit

class PolicyStatusController: UIViewController {
    
    let IDInfo = IDVerificationInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
\        let api = API(endPoint: "/policy", )
        api.post()
        
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
