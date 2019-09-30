//
//  PolicyProposalsController.swift
//  wageulSeoul
//
//  Created by HSH on 08/09/2019.
//  Copyright © 2019 HSH. All rights reserved.
//

import Foundation
import UIKit

class PolicyProposalsController: UIViewController {
    
    var info: [PolicyProposalsInfo] = []
    var data: NSDictionary = [:]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let api = API(endPoint: "/opinion", token: "bearer \(UserDefaults.standard.value(forKey: "token") as! String)")
        api.get() { (reviews) in
            self.data = reviews
            self.info = self.createArray()
            
            self.tableView.delegate = self
            self.tableView.dataSource = self
            
        }
    }
    
    func createArray() -> [PolicyProposalsInfo]{
           
           var tempArray: [PolicyProposalsInfo] = []
        
        
           let array = data["data"] as! NSArray
           
           for item in array {
               let i = item as! NSDictionary
               //print(i["id"]!)
               //String(format: "%@", i["title"]! as! CVarArg)
            let tempCell = PolicyProposalsInfo(timeStamp: String(format: "%@", i["created_at"]! as! CVarArg), title: String(format: "%@", i["title"]! as! CVarArg), mainImage: String(format: "%@", i["image_url"]! as! CVarArg), heartActive: i["given"]! as! Bool, heartNum: String(format: "%@", i["heart"]! as! CVarArg), commentNum: String(format: "%@", i["comments"]! as! CVarArg))
        
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

extension PolicyProposalsController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = self.info[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "proposalCell") as! PolicyProposalsTableViewCell
        cell.setCell(policyProposalsInfo: info)
        return cell
    }
}
