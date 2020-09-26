//
//  File.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/7/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import Foundation

struct Employee {
    let fullName: String;
    let id: String;
    
    init(dic: [String: String]) {
        self.fullName = dic["fullName"] as! String;
        self.id = dic["_id"] as! String;
    }
}
