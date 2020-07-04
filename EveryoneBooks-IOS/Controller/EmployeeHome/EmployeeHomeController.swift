//
//  EmployeeHomeController.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/8/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class EmployeeHomeController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
        configureView()
    }
    
    private let getAddedText: UIView = {
        let uiv = UIView();
        uiv.layer.borderColor = .CGBlack;
        uiv.layer.borderWidth = 2.0;
        uiv.backgroundColor = .white;
        let uitv = UITextView()
        uitv.text! = "Welcome to EveryoneBooks! To get started, you will need to send your unique ID to your employer/administrator. They will be able to use this ID to register you with the business you work for. Your ID is: "
        uitv.isScrollEnabled = false;
        uitv.isEditable = false;
        uitv.font = .systemFont(ofSize: 16);
        let uitv2 = UITextView();
        uitv2.text = Utilities().getEmployeeId();
        uitv2.isScrollEnabled = false;
        uitv2.isEditable = false;
        uitv2.isSelectable = true;
        uitv2.font = .boldSystemFont(ofSize: UIScreen.main.bounds.width / 20);
        uiv.addSubview(uitv)
        uiv.addSubview(uitv2);
        uitv.padTop(from: uiv.topAnchor, num: 15);
        uitv.padLeft(from: uiv.leftAnchor, num: 10);
        uitv2.padTop(from: uitv.bottomAnchor, num: 6);
        uitv2.padLeft(from: uiv.leftAnchor, num: 13);
        uitv.setWidth(width: UIScreen.main.bounds.width / 1.3)
        return uiv;
    }()
    
    private let sendIdButton: UIButton = {
        let uib = Components().createNormalButton(title: "Send ID To Employer/Admin");
        return uib;
    }()
    
    private let logoutButton: UIButton = {
        let uib = Components().createNormalButton(title: "Logout");
        uib.addTarget(self, action: #selector(logout), for: .touchUpInside)
        return uib;
    }()
    
    func configureTabs() {
        let employeeSchedule = Components().createNavBarItemController(image: UIImage(named: "calendar"), viewController: EmployeeSchedule(), title: "Schedule");
        let employeeNotis = Components().createNavBarItemController(image: UIImage(named: "notis"), viewController: EmployeeSchedule(), title: "Notifications");
        let employeeBusinesses = Components().createNavBarItemController(image: UIImage(named: "business-tab-bar"), viewController: EmployeeBusiness(), title: "Businesses");
        viewControllers = [employeeSchedule, employeeNotis, employeeBusinesses]
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
        navigationController?.navigationBar.backgroundColor = .white;
        view.addSubview(getAddedText);
        getAddedText.padTop(from: view.safeAreaLayoutGuide.topAnchor, num: 70);
        getAddedText.centerTo(element: view.centerXAnchor);
        getAddedText.setWidth(width: view.frame.width / 1.2);
        getAddedText.setHeight(height: view.frame.height / 2.2);
        view.addSubview(sendIdButton);
        sendIdButton.centerTo(element: view.centerXAnchor);
        sendIdButton.padTop(from: getAddedText.bottomAnchor, num: 50);
        sendIdButton.setHeight(height: 50);
        sendIdButton.setWidth(width: 300);
        view.addSubview(logoutButton);
        logoutButton.padTop(from: sendIdButton.bottomAnchor, num: 20);
        logoutButton.setWidth(width: 200);
        logoutButton.setHeight(height: 50);
        logoutButton.centerTo(element: view.centerXAnchor);
    }
}
