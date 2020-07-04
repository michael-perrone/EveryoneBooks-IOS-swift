//
//  ViewController.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 5/31/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class HelpRegModal: UICollectionViewController {

    private let data: [[String:String]] = [[ "title": "Step 1: Enter Business Name", "information": "Please enter the name of your business. Please type out full business name and check that spelling is accurate."], [ "title": "Step 2: Enter Business Type", "information": "Enter the type of business that you are registering. If the type of business you own is not listed within the drop-down menu. Please selector 'Other'"], [ "title": "Step 3: Enter Admin Information", "information": "Enter an email and password combination that you have access to. This email and password will be your credentials to log into your admin account in the future."], [ "title": "Step 4: Enter Business Location", "information": "Enter the location of which your business resides. This information is for customers who seek the address of your business. It will also let customers view your business based on location."],  [ "title": "Step 5: Enter Business Information", "information": "Enter the phone number and website that people can reach your business at. The website is optional and is okay to leave blank if your business does not have one." ], [ "title": "Step 6: Enter Weekend Schedule", "information": "Enter the OPEN and CLOSE date of your business on each weekend day. Use the drop-down menu to select applicable times. If your business is closed on a certain day. Scroll down one time to find the 'Closed' option."], [  "title": "Step 7: Enter Weeekday Schedule", "information": "Enter the OPEN and CLOSE date of your business on each weekday. Use the drop-down menu to select applicable times. If your business is closed on a certain day. Scroll down one time to find the 'Closed' option." ],  [  "title": "Step 8: Enter Booking Area", "information": "Enter the area which your business will need to be booked for appointments. For example: a massage parlor takes appointments in an individual room, a tattoo studio may conduct appointments in individual rooms or chairs, and a medical office would book out individual offices." ], [  "title": "Step 9: Enter Booking Area Number", "information": "Enter the number of items which you listed above. For example, if your massage parlor has 8 rooms to take appointments in. Scroll down to 8 in the drop-down menu. If your wax center has 6 rooms to take appointments in, choose 6." ]]
    

    private let instructionsText: UITextView = {
        let uitv = UITextView();
        uitv.font = .boldSystemFont(ofSize: 18);
        uitv.textColor = .darkGray;
        uitv.text = "Instructions"
        uitv.isEditable = false;
        uitv.isScrollEnabled = false;
        uitv.backgroundColor = .clear;
        return uitv;
    }()
    
    @objc func cancel() {
           self.dismiss(animated: true, completion: nil);
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
       
    }
    
    func configureUI() {
        navigationItem.titleView = instructionsText;
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        collectionView.register(AdminRegHelpCellCollectionViewCell.self, forCellWithReuseIdentifier: "AdminHelpCell");
        collectionView.backgroundColor = .white;
   
        
    }
}


extension HelpRegModal {
     override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count;
     }
     
     override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdminHelpCell", for: indexPath) as! AdminRegHelpCellCollectionViewCell;
        cell.title = data[indexPath.row]["title"]!
        cell.details = data[indexPath.row]["information"]!
        cell.configureUI()
         return cell;
     }
 }

 extension HelpRegModal: UICollectionViewDelegateFlowLayout {
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: view.frame.width, height: 190);
     }
 }

