//
//  IDMessege.swift
//  wageulSeoul
//
//  Created by HSH on 24/09/2019.
//  Copyright © 2019 HSH. All rights reserved.
//

import Foundation

final class Messege: Codable{
    var phone: String
    
    init(phone: String) {
        self.phone = phone
    }
}
