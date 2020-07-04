//
//  BusinessProfile.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/11/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import Foundation

struct BusinessProfile {
    var employeesPending: [String]?;
    var employeesIn: [String]?;
    var serviceTypes: [String]?;
    var bio: String?;
    
    init(dic: [String: Any]) {
        employeesPending = dic["employeesToSendInvite"] as? [String];
        employeesIn = dic["employeesWhoAccepted"] as? [String];
        serviceTypes = dic["serviceTypes"] as? [String];
        bio = dic["bio"] as? String;
    }
}
