//
//  Shift.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 7/5/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import Foundation


struct Shift {
    var timeStart: String;
    var timeEnd: String;
    var employeeName: String;
    var id: String;
    
    init(dic: [String: String]) {
        self.timeStart = dic["timeStart"]!;
        self.timeEnd = dic["timeEnd"]!;
        self.employeeName = dic["employeeName"]!;
        self.id = dic["_id"]!;
    }
    
    
}
