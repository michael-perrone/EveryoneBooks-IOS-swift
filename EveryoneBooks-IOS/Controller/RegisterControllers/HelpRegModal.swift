//
//  ViewController.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 5/31/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class HelpRegModal: UIViewController {
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView();
        sv.setWidth(width: fullWidth);
        sv.setHeight(height: fullHeight);
        sv.backgroundColor = .literGray;
        sv.contentSize = CGSize(width: fullWidth, height: 1650)
        return sv;
    }()

    private let instructionsText: UITextView = {
        let uitv = UITextView();
        uitv.font = .boldSystemFont(ofSize: 18);
        uitv.textColor = .black;
        uitv.text = "Instructions"
        uitv.isEditable = false;
        uitv.isScrollEnabled = false;
        uitv.backgroundColor = .clear;
        return uitv;
    }()
    
    private let title1: UITextView = {
        let uitv = Components().createTitleText(text: "Step 1: Enter Business Name");
        return uitv;
    }()
    
    private let details1: UITextView = {
        let uitv = Components().createDetailText(text: "Please enter the name of your business. Please type out full business name and check that spelling is accurate.");
        return uitv;
    }()
    
    private let title2: UITextView = {
        let uitv = Components().createTitleText(text: "Step 2: Enter Business Type");
        return uitv;
    }();
    
    private let details2: UITextView = {
        let uitv = Components().createDetailText(text: "Enter the type of business that you are registering. If the type of business you own is not listed within the drop-down menu. Please selector 'Other'");
        return uitv;
    }();

    private let title3: UITextView = {
        let uitv = Components().createTitleText(text: "Step 3: Enter Admin Information");
        return uitv;
    }();
    
    private let details3: UITextView = {
        let uitv = Components().createDetailText(text: "Enter an email and password combination that you have access to. This email and password will be your credentials to log into your admin account in the future.");
        return uitv;
    }();
    
    private let title4: UITextView = {
        let uitv = Components().createTitleText(text: "Step 4: Enter Business Location");
        return uitv;
    }();
    
    private let details4: UITextView = {
        let uitv = Components().createDetailText(text: "Enter the location of which your business resides. This information is for customers who seek the address of your business. It will also let customers view your business based on location.");
        return uitv;
    }();
    
    private let title5: UITextView = {
        let uitv = Components().createTitleText(text: "Step 5: Enter Business Information");
        return uitv;
    }();
    
    private let details5: UITextView = {
        let uitv = Components().createDetailText(text: "Enter the phone number and website that people can reach your business at. The website is optional and is okay to leave blank if your business does not have one.");
        return uitv;
    }();
    
    private let title6: UITextView = {
        let uitv = Components().createTitleText(text: "Step 6: Enter Weekend Schedule");
        return uitv;
    }();
    
    private let details6: UITextView = {
        let uitv = Components().createDetailText(text: "Enter the OPEN and CLOSE date of your business on each weekend day. Use the drop-down menu to select applicable times. If your business is closed on a certain day. Scroll down one time to find the 'Closed' option.");
        return uitv;
    }();
    
    private let title7: UITextView = {
        let uitv = Components().createTitleText(text: "Step 7: Enter Weeekday Schedule");
        return uitv;
    }();
    
    private let details7: UITextView = {
        let uitv = Components().createDetailText(text: "Enter the OPEN and CLOSE date of your business on each weekday. Use the drop-down menu to select applicable times. If your business is closed on a certain day. Scroll down one time to find the 'Closed' option.");
        return uitv;
    }();
    
    private let title8: UITextView = {
        let uitv = Components().createTitleText(text: "Step 8: Enter Booking Area");
        return uitv;
    }();
    
    private let details8: UITextView = {
        let uitv = Components().createDetailText(text: "Enter the area which your business will need to be booked for appointments. For example: a massage parlor takes appointments in an individual room, a tattoo studio may conduct appointments in individual rooms or chairs, and a medical office would book out individual offices.");
        return uitv;
    }();
    
    private let title9: UITextView = {
        let uitv = Components().createTitleText(text: "Step 9: Enter Booking Area Number");
        return uitv;
    }();
    
    private let details9: UITextView = {
        let uitv = Components().createDetailText(text: "Enter the number of items which you listed above. For example, if your massage parlor has 8 rooms to take appointments in. Scroll down to 8 in the drop-down menu. If your wax center has 6 rooms to take appointments in, choose 6.");
        return uitv;
    }();
    
    private let title10: UITextView = {
           let uitv = Components().createTitleText(text: "Step 10: Enter if Employees Stay in Same Thing/Area");
           return uitv;
       }();
       
       private let details10: UITextView = {
           let uitv = Components().createDetailText(text: "Choose yes or no depending on whether your business will have it's employees moving from different rooms during one shift. If your employee will be on the same area you specified above for the whole shift, click yes, otherwise click no.");
           return uitv;
       }();
    
    private let b1 = Components().createBorder(height: 1, width: fullWidth, color: .black);
    private let b2 = Components().createBorder(height: 1, width: fullWidth, color: .black);
    private let b3 = Components().createBorder(height: 1, width: fullWidth, color: .black);
    private let b4 = Components().createBorder(height: 1, width: fullWidth, color: .black);
    private let b5 = Components().createBorder(height: 1, width: fullWidth, color: .black);
    private let b6 = Components().createBorder(height: 1, width: fullWidth, color: .black);
    private let b7 = Components().createBorder(height: 1, width: fullWidth, color: .black);
    private let b8 = Components().createBorder(height: 1, width: fullWidth, color: .black);
    private let b9 = Components().createBorder(height: 1, width: fullWidth, color: .black); 
    
    @objc func cancel() {
           self.dismiss(animated: true, completion: nil);
       }
    
     override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
     }
    
    func configureUI() {
        navigationItem.titleView = instructionsText;
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(cancel));
        view.backgroundColor = .literGray;
        view.addSubview(scrollView);
        scrollView.addSubview(title1);
        title1.padTop(from: scrollView.topAnchor, num: 8);
        title1.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(details1);
        details1.padTop(from: title1.bottomAnchor, num: 8);
        details1.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(b1);
        b1.padTop(from: details1.bottomAnchor, num: 4);
        scrollView.addSubview(title2);
        title2.padTop(from: b1.bottomAnchor, num: 8);
        title2.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(details2);
        details2.padTop(from: title2.bottomAnchor, num: 8);
        details2.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(b2);
        b2.padTop(from: details2.bottomAnchor, num: 4);
        scrollView.addSubview(title3);
        title3.padTop(from: b2.bottomAnchor, num: 8);
        title3.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(details3);
        details3.padTop(from: title3.bottomAnchor, num: 8);
        details3.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(b3);
        b3.padTop(from: details3.bottomAnchor, num: 4);
        scrollView.addSubview(title4);
        title4.padTop(from: b3.bottomAnchor, num: 8);
        title4.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(details4);
        details4.padTop(from: title4.bottomAnchor, num: 8);
        details4.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(b4);
        b4.padTop(from: details4.bottomAnchor, num: 4);
        scrollView.addSubview(title5);
        title5.padTop(from: b4.bottomAnchor, num: 8);
        title5.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(details5);
        details5.padTop(from: title5.bottomAnchor, num: 8);
        details5.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(b5);
        b5.padTop(from: details5.bottomAnchor, num: 4);
        scrollView.addSubview(title6);
        title6.padTop(from: b5.bottomAnchor, num: 8);
        title6.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(details6);
        details6.padTop(from: title6.bottomAnchor, num: 8);
        details6.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(b6);
        b6.padTop(from: details6.bottomAnchor, num: 4);
        scrollView.addSubview(title7);
        title7.padTop(from: b6.bottomAnchor, num: 8);
        title7.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(details7);
        details7.padTop(from: title7.bottomAnchor, num: 8);
        details7.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(b7);
        b7.padTop(from: details7.bottomAnchor, num: 4);
        scrollView.addSubview(title8);
        title8.padTop(from: b7.bottomAnchor, num: 8);
        title8.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(details8);
        details8.padTop(from: title8.bottomAnchor, num: 8);
        details8.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(b8);
        b8.padTop(from: details8.bottomAnchor, num: 4);
        scrollView.addSubview(title9);
        title9.padTop(from: b8.bottomAnchor, num: 8);
        title9.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(details9);
        details9.padTop(from: title9.bottomAnchor, num: 8);
        details9.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(b9);
        b9.padTop(from: details9.bottomAnchor, num: 4);
        scrollView.addSubview(title10);
        title10.padTop(from: b9.bottomAnchor, num: 8);
        title10.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(details10);
        details10.padTop(from: title10.bottomAnchor, num: 4);
        details10.centerTo(element: scrollView.centerXAnchor);
        scrollView.addSubview(details10)
    }
}


