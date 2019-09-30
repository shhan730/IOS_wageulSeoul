//
//  PolicyProposalsTableViewCell.swift
//  wageulSeoul
//
//  Created by HSH on 30/09/2019.
//  Copyright © 2019 HSH. All rights reserved.
//

import UIKit

class PolicyProposalsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var timeStamp: UILabel!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var heartImage: UIImageView!
    
    @IBOutlet weak var heartNum: UILabel!
    
    @IBOutlet weak var commentNum: UILabel!
    
    func setCell(policyProposalsInfo: PolicyProposalsInfo){
        timeStamp.text = policyProposalsInfo.timeStamp
        title.text = policyProposalsInfo.title
        mainImage.downloaded(from: String(format: "%@", policyProposalsInfo.mainImage as CVarArg))
        heartNum.text = policyProposalsInfo.heartNum
        commentNum.text = policyProposalsInfo.commentNum
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
