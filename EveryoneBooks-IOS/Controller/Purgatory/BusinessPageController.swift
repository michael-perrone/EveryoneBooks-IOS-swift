//
//  BusinessPageController.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/27/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class BusinessPageController: UIViewController {
    
    var businessId: String? {
        didSet {
            getBusinessInfo();
        }
    }
    
    var services: [String]? {
        didSet {
            table.services = self.services;
        }
    }
    
    var schedule: Schedule? {
        didSet {
            DispatchQueue.main.async {
                if self.schedule!.sunOpen == "Closed" || self.schedule!.sunClose == "Closed" {
                    self.sunText.text = "Sun: Closed"
                }
                else {
                    self.sunText.text = "Sun: \(self.schedule!.sunOpen)-\(self.schedule!.sunClose)"
                }
                if self.schedule!.monOpen == "Closed" || self.schedule!.monClose == "Closed" {
                    self.monText.text = "Mon: Closed"
                }
                else {
                    self.monText.text = "Mon: \(self.schedule!.monOpen)-\(self.schedule?.monClose ?? "")"
                }
                if self.schedule!.tueOpen == "Closed" || self.schedule!.tueClose == "Closed" {
                    self.tueText.text = "Tue: Closed"
                }
                else {
                    self.tueText.text = "Tue: \(self.schedule!.tueOpen)-\(self.schedule!.tueClose)"
                }
                if self.schedule!.wedOpen == "Closed" || self.schedule!.wedClose == "Closed" {
                    self.wedText.text = "Wed: Closed"
                }
                else {
                    self.wedText.text = "Wed: \(self.schedule!.wedOpen)-\(self.schedule!.wedClose)"
                }
                if self.schedule?.thuOpen == "Closed" || self.schedule?.thuClose == "Closed" {
                    self.thuText.text = "Thu: Closed"
                }
                else {
                    self.thuText.text = "Thu: \(self.schedule!.thuOpen)-\(self.schedule!.thuClose)"
                }
                if self.schedule!.friOpen == "Closed" || self.schedule!.friClose == "Closed" {
                    self.friText.text = "Fri: Closed"
                }
                else {
                    self.friText.text = "Fri: \(self.schedule!.friOpen)-\(self.schedule!.friClose)"
                }
                if self.schedule!.satOpen == "Closed" || self.schedule!.satClose == "Closed" {
                    self.satText.text = "Sat: Closed"
                }
                else {
                    self.satText.text = "Sat: \(self.schedule!.satOpen)-\(self.schedule!.satClose)"
                }
            }
           }
        }
    
    var business: Business? {
        didSet {
            DispatchQueue.main.async {
                self.navigationItem.title = self.business?.nameOfBusiness!;
                self.streetText.text = self.business?.street;
                self.stateText.text = self.business?.state;
                self.cityText.text = self.business?.city;
                self.zipText.text = self.business?.zip;
                self.phoneText.text = self.business?.phone;
                self.webText.text = self.business?.website;
            }
        }
    }
    
    lazy var bookButton: UIButton = {
        let uib = Components().createRightButton(title: "Book");
        uib.addTarget(self, action: #selector(goToBook), for: .touchUpInside)
        return uib;
    }();
    
    @objc func goToBook() {
       
    }
    
    lazy var xButton: UIButton = {
        let uib = Components().createXButton();
        uib.addTarget(self, action: #selector(exit), for: .touchUpInside);
        return uib;
    }()
    
    private var streetText: UITextView = {
        let uitv = Components().createSimpleText(text: "");
        uitv.font = .boldSystemFont(ofSize: 14);
        uitv.setHeight(height: 40);
        uitv.backgroundColor = .literGray;
        return uitv;
    }()
    
    private var cityText: UITextView = {
        let uitv = Components().createSimpleText(text: "");
        uitv.font = .boldSystemFont(ofSize: 14);
        uitv.backgroundColor = .literGray;
        uitv.setHeight(height: 40);
        return uitv;
    }()
    
    private var stateText: UITextView = {
        let uitv = Components().createSimpleText(text: "");
        uitv.font = .boldSystemFont(ofSize: 14);
        uitv.backgroundColor = .literGray;
        uitv.setHeight(height: 40);
        return uitv;
    }()
    
    private var zipText: UITextView = {
        let uitv = Components().createSimpleText(text: "");
        uitv.font = .boldSystemFont(ofSize: 14);
        uitv.backgroundColor = .literGray;
        uitv.setHeight(height: 40);
        return uitv;
    }()
    
    private var phoneText: UITextView = {
        let uitv = Components().createSimpleText(text: "");
        uitv.font = .boldSystemFont(ofSize: 14);
        uitv.backgroundColor = .literGray;
        uitv.setHeight(height: 40);
        return uitv;
    }()
    
    var webText: UITextView = {
        let uitv = Components().createSimpleText(text: "");
        uitv.font = .boldSystemFont(ofSize: 14);
        uitv.backgroundColor = .literGray;
        uitv.setHeight(height: 40);
        return uitv;
    }()
    
    var sunText: UITextView = {
        let uitv = Components().createSimpleText(text: "");
        uitv.font = .boldSystemFont(ofSize: 14);
        uitv.backgroundColor = .literGray;
        return uitv;
    }()
    
    var monText: UITextView = {
        let uitv = Components().createSimpleText(text: "");
        uitv.font = .boldSystemFont(ofSize: 14);
        uitv.backgroundColor = .literGray;
        return uitv;
    }()
    
    var tueText: UITextView = {
        let uitv = Components().createSimpleText(text: "");
        uitv.font = .boldSystemFont(ofSize: 14);
        uitv.backgroundColor = .literGray;
        return uitv;
    }()
    
    var wedText: UITextView = {
        let uitv = Components().createSimpleText(text: "");
        uitv.font = .boldSystemFont(ofSize: 14);
        uitv.backgroundColor = .literGray;
        return uitv;
    }()
    
    var thuText: UITextView = {
        let uitv = Components().createSimpleText(text: "");
        uitv.font = .boldSystemFont(ofSize: 14);
        uitv.backgroundColor = .literGray;
        return uitv;
    }()
    
    var friText: UITextView = {
        let uitv = Components().createSimpleText(text: "");
        uitv.font = .boldSystemFont(ofSize: 14);
        uitv.backgroundColor = .literGray;
        return uitv;
    }()
    
    var satText: UITextView = {
        let uitv = Components().createSimpleText(text: "");
        uitv.font = .boldSystemFont(ofSize: 14);
        uitv.backgroundColor = .literGray;
        return uitv;
    }()
    
    private let scrollView: UIScrollView = {
        let uisv = UIScrollView();
        let size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1.3);
        uisv.contentSize = size;
        uisv.backgroundColor = .literGray;
        return uisv;
    }()
    
    private let table: ServicesDisplayTable = {
        let table = ServicesDisplayTable();
        return table;
    }()
    
    private let serviceText: UITextView = {
        let uitv = Components().createSimpleText(text: "Services");
        return uitv;
    }()
    
    private let locationHoursText: UITextView = {
        let uitv = Components().createSimpleText(text: "Location/Hours");
        return uitv;
    }();
    
    
    @objc func exit() {
        self.dismiss(animated: true, completion: nil);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func getBusinessInfo() {
        let data = ["businessId": self.businessId!];
        API().post(url: "http://localhost:4000/api/business/appBusiness", dataToSend: data) { (res) in
            print(res)
            if var business = res["business"] as? [String: Any] {
                self.schedule = Schedule(dic: business["schedule"] as! [[String: String]])
                business.removeValue(forKey: "schedule");
                let actualBusiness = business as! [String: String];
                self.business = Business(dic: actualBusiness);
            }
            if let services = res["services"] as? [String] {
               
                self.services = services;
            }
        }
    }
    

    func configureView() {
        navigationController?.navigationBar.barTintColor = .mainLav;
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: xButton);
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: bookButton);
        view.backgroundColor = .literGray;
        view.addSubview(scrollView);
        scrollView.padLeft(from: view.leftAnchor, num: 0);
        scrollView.padTop(from: view.safeAreaLayoutGuide.topAnchor, num: 0);
        scrollView.setHeight(height: view.frame.height);
        scrollView.setWidth(width: view.frame.width);
        let infoView = UIStackView(arrangedSubviews: [streetText, cityText, stateText, zipText, phoneText, webText]);
        infoView.backgroundColor = .liteGray;
        infoView.setHeight(height: 225);
        infoView.setWidth(width: view.frame.width / 2.05);
        infoView.backgroundColor = .liteGray;
        infoView.axis = .vertical;
        scrollView.addSubview(locationHoursText);
        locationHoursText.padTop(from: scrollView.topAnchor, num: 10);
        locationHoursText.centerTo(element: view.centerXAnchor);
        scrollView.addSubview(infoView);
        infoView.padLeft(from: view.leftAnchor, num: view.frame.width / 2 - view.frame.width / 2.05);
        infoView.padTop(from: scrollView.topAnchor, num: 70);
        let scheduleView = UIStackView(arrangedSubviews: [sunText, monText, tueText, wedText, thuText, friText, satText]);
        scheduleView.backgroundColor = .liteGray;
        scheduleView.setHeight(height: 225);
        scheduleView.setWidth(width: view.frame.width / 2);
        scheduleView.backgroundColor = .liteGray;
        scheduleView.axis = .vertical;
        scrollView.addSubview(scheduleView);
        scheduleView.padRight(from: view.rightAnchor, num: view.frame.width / 2 - view.frame.width / 2.05);
        scheduleView.padTop(from: scrollView.topAnchor, num: 70);
        view.addSubview(serviceText);
        serviceText.centerTo(element: view.centerXAnchor);
        serviceText.padTop(from: scheduleView.bottomAnchor, num: 40);
        view.addSubview(table);
        table.centerTo(element: view.centerXAnchor);
        table.padTop(from: scheduleView.bottomAnchor, num: 90);
        
    }

}
