//
//  IDMessege.swift
//  wageulSeoul
//
//  Created by HSH on 24/09/2019.
//  Copyright © 2019 HSH. All rights reserved.
//

import Foundation

class Message: Codable{
    var phone: String
    var code: String?
    
    init(phone: String) {
        self.phone = phone
        self.code = nil
    }
    
    init(phone: String, code: String) {
        self.phone = phone
        self.code = code
    }
}
