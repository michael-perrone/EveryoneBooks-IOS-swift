//
//  AdminHomeController.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/3/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class AdminHomeController: UITabBarController {

    private let menuButton: UIButton = {
        let uib = Components().createMenuButton();
        uib.addTarget(self, action: #selector(logout), for: .touchUpInside);
        uib.setHeight(height: 30);
        uib.setWidth(width: 60)
        return uib;
    }();
    
    
       
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
    }
    
    func configureTabs() {
        let notifications = Components().createNavBarItemController(image: UIImage(named: "notis"), viewController: AdminNotifications(collectionViewLayout: UICollectionViewFlowLayout()), title: "Notifications")
        let businessHome = Components().createNavBarItemController(image: UIImage(named: "business-tab-bar"), viewController: AdminBookings(), title: "Service Schedule")
        let schedule = Components().createNavBarItemController(image: UIImage(named: "calendar"), viewController: AdminShifts(), title: "Shift Schedule")
        viewControllers = [businessHome, schedule, notifications];
    }
    
    func configureUI() {
        view.backgroundColor = .mainLav;
        view.addSubview(menuButton);
        menuButton.padLeft(from: view.leftAnchor, num: 20);
        menuButton.padTop(from: view.safeAreaLayoutGuide.topAnchor, num: 10);
    }
    
    func getBusiness() {
        let url = myURL + "businessProfile/myBusinessForProfile";
        API().get(url: url, headerToSend: Utilities().getAdminToken()) { (res) in
            if let profileCreated = res["profileCreated"] as? Bool {
                if (profileCreated) {
                    print("DEBUGY   : for now all good")
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
