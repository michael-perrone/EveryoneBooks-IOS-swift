//
//  EmployeeHomeController.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/8/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class EmployeeHomeController: UITabBarController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear( animated);
        configureTabs();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    private let menuButton: UIButton = {
        let uib = Components().createMenuButton()
        uib.addTarget(self, action: #selector(logout), for: .touchUpInside)
        return uib;
    }()
    
    func configureTabs() {
        print("ANY FUCKN THING")
        print(Utilities().getEmployeeToken())
        let businessName = Utilities().decodeEmployeeToken()?["businessName"] as? String;
        print(businessName)
        if businessName == nil {
            API().get(url: myURL + "notifications/employeeHas", headerToSend: Utilities().getEmployeeToken()) { (res) in
                print(res)
                print("HI")
                if res["notis"] as! Bool == false {
                    DispatchQueue.main.async {
                        let home = Components().createNavBarItemController(image: UIImage(named: "calendar"), viewController: SendEmployeeIdViewController(), title: "Home");
                        let notifications = Components().createNavBarItemController(image: UIImage(named: "notis"), viewController: EmployeeNotifications(collectionViewLayout: UICollectionViewFlowLayout()), title: "Notifications")
                        self.viewControllers = [home, notifications]
                    }
                }
                else {
                    DispatchQueue.main.async {
                        let employeeSchedule = Components().createNavBarItemController(image: UIImage(named: "calendar"), viewController: EmployeeSchedule(), title: "Schedule");
                        let notifications = Components().createNavBarItemController(image: UIImage(named: "notis"), viewController: EmployeeNotifications(collectionViewLayout: UICollectionViewFlowLayout()), title: "Notifications")
                        self.viewControllers = [employeeSchedule, notifications]
                    }
                }
            }
        }
    }
    
    @objc func logout() {
        let loginController = UINavigationController(rootViewController: LoginController());
        loginController.modalPresentationStyle = .fullScreen;
        loginController.modalTransitionStyle = .crossDissolve;
        Utilities().logout(key: "employeeToken");
        self.present(loginController, animated: true, completion: nil);
    }
    
    func configureView() {
        view.backgroundColor = .literGray;
        navigationController?.navigationBar.barTintColor = .mainLav;
        view.addSubview(menuButton);
        menuButton.padTop(from: view.safeAreaLayoutGuide.topAnchor, num: 5);
        menuButton.padRight(from: view.rightAnchor, num: 20);
        menuButton.padRight(from: view.rightAnchor, num: 20);
        tabBar.backgroundColor = .mainLav;
        tabBar.barTintColor = .mainLav;
    }
}
