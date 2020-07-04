//
//  Booking.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/7/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import Foundation

struct Booking {
    let timeStart: String?;
    let timeEnd: String?;
    let serviceName: String?;
    
    init(dic: [String: String]) {
        self.timeStart = dic["timeStart"];
        self.timeEnd = dic["timeEnd"];
        self.serviceName = dic["serviceName"]
    }
}

