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
    
    @IBOutlet weak var tabelView: UITableView!
    
    var info: [PolicyStatusInfo] = []
    var data: NSDictionary = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let api = API(endPoint: "/policy", token: "Bearer \(UserDefaults.standard.value(forKey: "token") as! String)")
        api.get() { (reviews) in
            self.data = reviews
            self.info = self.createArray()
            self.tabelView.delegate = self
            self.tabelView.dataSource = self
        }
    }
    
    func createArray() -> [PolicyStatusInfo]{
        
        var tempArray: [PolicyStatusInfo] = []
        
        let array = data["data"] as! NSArray
        
        for item in array {
            let i = item as! NSDictionary
            //print(i["id"]!)
            
            let tempCell = PolicyStatusInfo.init(title: String(format: "%@", i["title"]! as! CVarArg), catTag: String(format: "%@", i["tag"]! as! CVarArg), subTitle: String(format: "%@", i["write"]! as! CVarArg), heartNum: String(format: "%@", i["heart"]! as! CVarArg), isHeartClicked: i["given"]! as! Bool, id: i["id"]! as! Int, url: String(format: "%@", i["url"]! as! CVarArg))
            tempArray.append(tempCell)
            
        }
        
        return tempArray
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
extension PolicyStatusController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = self.info[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "statusCell") as! PolicyStatusTableViewCell
        cell.setCell(policyStatusInfo: info)
        return cell
    }
}
