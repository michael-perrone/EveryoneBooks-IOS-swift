//
//  Business.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/6/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import Foundation

struct Business {
    let street: String?;
    let city: String?;
    let state: String?;
    let zip: String?;
    let typeOfBusiness: String?;
    let nameOfBusiness: String?;
    let id: String?;
    let bookingColumnNumber: String?;
    let bookingColumnType: String?;
    let website: String?
    let phone: String?
    
    init(dic: [String:String]) {
        self.street = dic["address"];
        self.city = dic["city"];
        self.state = dic["state"];
        self.zip = dic["zip"];
        self.typeOfBusiness = dic["typeOfBusiness"];
        self.nameOfBusiness = dic["businessName"];
        self.id = dic["_id"];
        self.bookingColumnType = dic["bookingColumnType"];
        self.bookingColumnNumber = dic["bookingColumnNumber"];
        self.website = dic["website"];
        self.phone = dic["phoneNumber"];
    }
}
