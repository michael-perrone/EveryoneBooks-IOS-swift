//
//  EditBusiness.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/7/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class EditBusiness: UITabBarController {

    var message: String? {
        didSet {
           // present setup here
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
    }
    
    
    func configureTabs() {
        let settings = Components().createNavBarItemController(image: UIImage(named: "business-tab-bar"), viewController: AdminSettings(), title: "Profile")
        let businessHome = Components().createNavBarItemController(image: UIImage(named: "service-bell-tab-bar"), viewController: AdminBookings(), title: "Home")
        let schedule = Components().createNavBarItemController(image: UIImage(named: "calendar"), viewController: AdminShifts(), title: "Schedule")
        viewControllers = [businessHome, schedule, settings]
    }
}

