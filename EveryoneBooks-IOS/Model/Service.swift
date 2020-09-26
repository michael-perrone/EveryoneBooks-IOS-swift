//
//  Service.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 7/4/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import Foundation


struct Service {
    let cost: Double;
    let timeDuration: String;
    let serviceName: String;
    let id: String;
    
    init(dic: [String: Any]) {
        self.cost = dic["cost"]! as! Double;
        self.timeDuration = dic["timeDuration"]! as! String;
        self.serviceName = dic["serviceName"]! as! String;
        self.id = dic["_id"] as! String;
    }
}
