//
//  PolicyProposalsInfo.swift
//  wageulSeoul
//
//  Created by HSH on 30/09/2019.
//  Copyright © 2019 HSH. All rights reserved.
//

import Foundation
import UIKit

class PolicyProposalsInfo{
    var timeStamp: String
    var title: String
    var mainImage: String
    var heartActive: Bool
    var heartNum: String
    var commentNum: String
    
    init(timeStamp: String, title: String, mainImage:String, heartActive: Bool, heartNum: String, commentNum: String) {
        self.timeStamp = timeStamp
        self.title = title
        self.mainImage = mainImage
        self.heartActive = heartActive
        self.heartNum = heartNum
        self.commentNum = commentNum
    }
}
