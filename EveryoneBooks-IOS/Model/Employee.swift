//
//  File.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/7/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import Foundation

struct Employee {
    let fullName: String?;
    let id: String?;
    let bookingsToday: [Booking]?;
    
    init(dic: [String: String], bookingsToday: [Booking]) {
        self.fullName = dic["fullName"];
        self.id = dic["id"];
        self.bookingsToday = bookingsToday;
    }
}
