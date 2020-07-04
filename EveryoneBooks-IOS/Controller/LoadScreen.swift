//
//  LoadScreen.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/3/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class LoadScreen: UIViewController {
    
    private let logoText: UITextView = {
        let uitv = Components().createLogoText();
        return uitv;
    }()
    
    private let logo: UIImageView = {
        let uiiv = Components().createBigLogo();
        return uiiv;
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }
    
    func configureView() {
        
        navigationController?.navigationBar.isHidden = true;
        view.backgroundColor = .mainLav;
        view.addSubview(logoText);
        logoText.padTop(from: view.safeAreaLayoutGuide.topAnchor, num: 5);
        logoText.centerTo(element: view.centerXAnchor);
        
        view.addSubview(logo);
        logo.padTop(from: logoText.bottomAnchor, num: view.frame.height / 3.8);
        logo.centerTo(element: view.centerXAnchor);
        
        loadApp()
        
    }
    
    
    func loadApp() {
        if Utilities().getAdminToken() != "nil" {
            let adminHome = AdminHomeController();
            adminHome.adminToken = Utilities().getAdminToken();
            let adminHomeNav = UINavigationController(rootViewController: adminHome)
            navigationController?.pushViewController(adminHomeNav, animated: true)
        }
        else if Utilities().getToken() != "nil" {
            let userHome = UserHome();
            userHome.token = Utilities().getToken();
            let userHomeNav = UINavigationController(rootViewController: userHome)
            navigationController?.pushViewController(userHomeNav, animated: true)
        }
        else if Utilities().getEmployeeToken() != "nil" {
            let employeeHome = EmployeeHome();
            employeeHome.employeeToken = Utilities().getToken();
            let employeeHomeNav = UINavigationController(rootViewController: employeeHome)
            navigationController?.pushViewController(employeeHomeNav, animated: true)
        }
        else {
            let loginController = LoginController();
            navigationController?.pushViewController(loginController, animated: true)
        }
    }

}
