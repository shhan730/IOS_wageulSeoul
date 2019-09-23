//
//  IDMessege.swift
//  wageulSeoul
//
//  Created by HSH on 24/09/2019.
//  Copyright © 2019 HSH. All rights reserved.
//

import Foundation

final class Messege: Codable{
    var phoneNum: String
    
    init(phoneNum: String) {
        self.phoneNum = phoneNum
    }
}
