//
//  UserInfoController.swift
//  wageulSeoul
//
//  Created by HSH on 08/09/2019.
//  Copyright © 2019 HSH. All rights reserved.
//

import Foundation
import UIKit

class UserInfoController: UIViewController {
    
    
    @IBOutlet weak var card1: UIView!
    
    @IBOutlet weak var card2: UIView!
    
    @IBOutlet weak var card3: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setShadow(object: card1)
        setShadow(object: card2)
        setShadow(object: card3)
        
        
        
    }
    
    func setShadow(object: UIView){
       object.layer.makeShadow(color: UIColor.init(displayP3Red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.16), x: 0, y: 1, blur: 2, spread: 0)
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

extension CALayer {

    func makeShadow(color: UIColor,
                    x: CGFloat = 0,
                    y: CGFloat = 0,
                    blur: CGFloat = 0,
                    spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = 1
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2
        if spread == 0 {
            shadowPath = nil
        }
        else {
            let rect = bounds.insetBy(dx: -spread, dy: -spread)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
