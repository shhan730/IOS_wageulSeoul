//
//  PolicyStatusInfo.swift
//  wageulSeoul
//
//  Created by HSH on 29/09/2019.
//  Copyright © 2019 HSH. All rights reserved.
//

import Foundation
import UIKit


class PolicyStatusInfo{
    var title: String
    var tag1: String
    var tag2: String
    var subTitle: String
    var heartNum: String
    var isHeartClicked: Bool
    
    init(title: String, tag1:String, tag2:String, subTitle:String,heartNum: String, isHeartClicked: Bool) {
        self.title = title
        self.tag1 = tag1
        self.tag2 = tag2
        self.subTitle = subTitle
        self.heartNum = heartNum
        self.isHeartClicked = isHeartClicked
    }
}

