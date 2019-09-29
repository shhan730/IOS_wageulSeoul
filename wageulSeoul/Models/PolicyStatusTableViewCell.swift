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
    
    @IBOutlet weak var heartButton: UIButton!
    
    var heartButtonActive: Bool = false
    
    func setCell(policyStatusInfo: PolicyStatusInfo){
        self.title.text = policyStatusInfo.title
        self.tag1.text = policyStatusInfo.tag1
        self.tag2.text = policyStatusInfo.tag2
        self.subTitile.text = policyStatusInfo.subTitle
        self.heartNum.text = policyStatusInfo.heartNum
        self.heartButtonActive = policyStatusInfo.isHeartClicked
        
        self.checkHeartButtonisActive()
        
    }
        
    @IBAction func heartButtonClick(_ sender: UIButton) {
        if self.heartButtonActive == true {self.heartButtonActive = false}
        else {self.heartButtonActive = true}
        self.checkHeartButtonisActive()
    }
    
    func checkHeartButtonisActive(){
        if self.heartButtonActive{
            self.heartButtonActive = false
            heartButton.setImage(UIImage(named : "spacedHeart"), for: UIControl.State.normal)
        }else{
            self.heartButtonActive = true
            heartButton.setImage(UIImage(named : "filledHeart"), for: UIControl.State.normal)
        }
    }
}
