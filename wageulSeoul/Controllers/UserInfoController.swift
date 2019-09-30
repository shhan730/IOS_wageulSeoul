//
//  UserInfoController.swift
//  wageulSeoul
//
//  Created by HSH on 08/09/2019.
//  Copyright © 2019 HSH. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class UserInfoController: UIViewController {
    
    @IBOutlet weak var card1: UIView!
    
    @IBOutlet weak var card2: UIView!
    
    @IBOutlet weak var card3: UIView!
    
    @IBOutlet weak var userAsset: UILabel!
    
    @IBOutlet weak var influence: UILabel!
    
    @IBOutlet weak var phoneNum: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setShadow(object: card1)
        setShadow(object: card2)
        setShadow(object: card3)
        
        self.phoneNum.text = UserDefaults.standard.value(forKey: "FinalPhoneNum") as? String
        
        let api = API(endPoint: "/auth/user", token: "bearer \(UserDefaults.standard.value(forKey: "token") as! String)")
        
        api.get() { (reviews) in
            
            let data = reviews["data"] as! NSDictionary
            
            print( String(format: "%@", data["id"]! as! CVarArg))
            
            self.influence.text = "영향력: \(String(format: "%@", data["power"]! as! CVarArg))"
            self.userAsset.text = "총자산: \(String(format: "%@", data["reward"]! as! CVarArg))"
            //self.userImage.downloaded(from: String(format: "%@", data["image"]! as! CVarArg))
            //self.setImageViewToCircle()
            
            }
        
        
        
    }
    
    func setShadow(object: UIView){
       object.layer.makeShadow(color: UIColor.init(displayP3Red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.16), x: 0, y: 1, blur: 2, spread: 0)
    }
    
    func setImageViewToCircle(){
        self.userImage.layer.cornerRadius = self.userImage.frame.size.width / 2
        self.userImage.clipsToBounds = true
        
//        self.userImage.layer.masksToBounds = true
//        self.userImage.layer.cornerRadius = self.userImage.bounds.width / 2
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

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            self.image = UIImage(data: data)
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
