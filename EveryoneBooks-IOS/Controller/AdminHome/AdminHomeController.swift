//
//  AdminHomeController.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/3/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class AdminHomeController: UITabBarController {
    
    var schedule: Schedule? {
        didSet {
            guard let adminHome = viewControllers?[0] as? UINavigationController else {return}
            
          
            guard let adminBookings = adminHome.viewControllers[0] as? AdminBookings else {return}
            adminBookings.schedule = schedule;
        }
    }
    
    var business: Business? {
        didSet {
            guard let adminHome = viewControllers?[0] as? UINavigationController else {return}
            guard let adminBookings = adminHome.viewControllers[0] as? AdminBookings else {return}
            adminBookings.business = business;
        }
    }

    private let logoutButton: UIButton = {
        let uib = Components().createNormalButton(title: "Logout");
        uib.addTarget(self, action: #selector(logout), for: .touchUpInside)
        return uib;
    }()
       
    @objc func logout() {
        Utilities().logout(key: "adminToken");
        DispatchQueue.main.async {
            let loginController = UINavigationController(rootViewController:LoginController());
            loginController.modalTransitionStyle = .crossDissolve;
            loginController.modalPresentationStyle = .fullScreen;
            self.present(loginController, animated: true, completion: nil);
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
        configureUI()
        getBusiness()
        // Do any additional setup after loading the view.
    }
    
    func configureTabs() {
        let notifications = Components().createNavBarItemController(image: UIImage(named: "notis"), viewController: AdminNotifications(), title: "Notifications")
        let businessHome = Components().createNavBarItemController(image: UIImage(named: "business-tab-bar"), viewController: AdminBookings(), title: "Home")
        let schedule = Components().createNavBarItemController(image: UIImage(named: "calendar"), viewController: AdminShifts(), title: "Shifts")
        viewControllers = [businessHome, schedule, notifications];
    }
    
    func configureUI() {
        view.backgroundColor = .mainLav;
        view.addSubview(logoutButton);
        logoutButton.centerTo(element: view.centerXAnchor);
        logoutButton.padTop(from: view.safeAreaLayoutGuide.topAnchor, num: 70);
    }
    
    func getBusiness() {
        let url = myURL + "businessProfile/myBusinessForProfile";
        
        API().get(url: url, headerToSend: Utilities().getAdminToken()) { (res) in
            if let profileCreated = res["profileCreated"] as? Bool {
                if (profileCreated) {
                    DispatchQueue.main.async {
                        if let business = res["business"] as? [String: Any] {
                            if let schedule = business["schedule"] as? [[String: String]] {
                                self.schedule = Schedule(dic: schedule)
                            }
                        }
                    }
                }
                else {
                    
                    DispatchQueue.main.async {
                        let editBusiness = EditBusinessProfile();
                        editBusiness.message = "Bitch What";
                        editBusiness.modalPresentationStyle = .fullScreen;
                        self.present(editBusiness, animated: true, completion: nil);
                    }
                }
            }
        }
    }
}
