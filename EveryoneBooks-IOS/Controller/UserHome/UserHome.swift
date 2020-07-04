//
//  UserHome.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/3/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit



class UserHome: UITabBarController {

    var token = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    

    func configureUI() {
        view.backgroundColor = .mainLav;
        navigationController?.navigationBar.isHidden = true;
    }
    
    func configureTabs() {
        let homeTab = 
    }
    

}
