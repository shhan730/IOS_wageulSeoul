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
    var catTag: String
    var subTitle: String
    var heartNum: String
    var isHeartClicked: Bool
    var id: Int
    
    init(title: String, catTag:String, subTitle:String,heartNum: String, isHeartClicked: Bool, id: Int) {
        self.title = title
        self.catTag = catTag
        self.subTitle = subTitle
        self.heartNum = heartNum
        self.isHeartClicked = isHeartClicked
        self.id = id
    }
}

