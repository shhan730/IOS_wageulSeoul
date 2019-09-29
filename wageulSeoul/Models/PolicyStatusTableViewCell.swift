//
//  PolicyStatusTableViewCell.swift
//  wageulSeoul
//
//  Created by HSH on 29/09/2019.
//  Copyright © 2019 HSH. All rights reserved.
//

import UIKit

class PolicyStatusTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var tag1: UILabel!
    
    @IBOutlet weak var tag2: UILabel!
    
    @IBOutlet weak var subTitile: UILabel!
    
    @IBOutlet weak var heartNum: UILabel!
    
    func setCell(policyStatusInfo: PolicyStatusInfo){
        self.title.text = policyStatusInfo.title
        self.tag1.text = policyStatusInfo.tag1
        self.tag2.text = policyStatusInfo.tag2
        self.subTitile.text = policyStatusInfo.subTitle
        self.heartNum.text = policyStatusInfo.heartNum
    }
    
    
}
