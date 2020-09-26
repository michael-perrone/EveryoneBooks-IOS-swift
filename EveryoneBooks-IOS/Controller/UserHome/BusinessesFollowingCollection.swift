//
//  BusinessSearchCollection.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/21/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

protocol OtherCollectionViewCellDelegate: BusinessesFollowingCollection {
    func showBusiness(bpId: String)
    
    func removeBusiness(index: Int);
    
    func bookAtBusiness(business: Business)
}

class BusinessesFollowingCollection: UICollectionViewController, OtherCollectionViewCellDelegate  {
    
    func bookAtBusiness(business: Business) {
        let userBookingSomething = UserBookingSomething();
        userBookingSomething.comingFromBusinessPage = false;
        userBookingSomething.business = business;
        navigationController?.pushViewController(userBookingSomething, animated: true);
    }
    
    func removeBusiness(index: Int) {
        businesses?.remove(at: index)
    }
    
    func showBusiness(bpId: String) {
        let bpController = BusinessPageController();
        bpController.businessId = bpId;
        let nav = UINavigationController(rootViewController: bpController);
        nav.modalPresentationStyle = .fullScreen;
        nav.modalTransitionStyle = .crossDissolve;
        self.present(nav, animated: true, completion: nil);
    }
    
    var businesses: [Business]? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    lazy var xButton: UIButton = {
        let uib = Components().createXButton();
        uib.addTarget(self, action: #selector(cancelButton), for: .touchUpInside);
        return uib;
    }()
    
  
    
    
    @objc func cancelButton() {
        self.dismiss(animated: true, completion: nil);
    }
   
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
        self.getFollowing();
    }
    
    func configureUI() {
        collectionView.register(BusinessesFollowingCollectionViewCell.self, forCellWithReuseIdentifier: "BusinessFollowingCell");
        collectionView.backgroundColor = .literGray;
        navigationController?.navigationBar.backgroundColor = .mainLav;
        navigationController?.navigationBar.barTintColor = .mainLav;
        let logoView = UIImageView(image: UIImage(named: "logo-small"));
        logoView.setHeight(height: 36);
        logoView.setWidth(width: 36);
        navigationItem.titleView = logoView;
    }

    func getFollowing() {
            API().get(url: "http://localhost:4000/api/userProfile/followingForTab", headerToSend: Utilities().getToken()) { (res) in
                guard let businessesFollow = res["businessesFollowing"] as? [[String: Any]] else {return}
                var businessesArray: [Business] = [];
                for businessFollowing in businessesFollow {
                    let newBusiness = Business(dic: businessFollowing);
                    businessesArray.append(newBusiness);
            }
                self.businesses = businessesArray;
        }
    }
}

extension BusinessesFollowingCollection {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if let businesses = businesses {
        return businesses.count;
    }
    else {
        return 0;
    }
}

override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BusinessFollowingCell", for: indexPath) as! BusinessesFollowingCollectionViewCell;
    if let businesses = businesses {
        cell.webText.text = businesses[indexPath.row].website;
        cell.phoneText.text = businesses[indexPath.row].phone;
        cell.businessName.text = businesses[indexPath.row].nameOfBusiness;
        cell.streetText.text = businesses[indexPath.row].street;
        cell.cityText.text = businesses[indexPath.row].city;
        cell.stateText.text = businesses[indexPath.row].state;
        cell.zipText.text = businesses[indexPath.row].zip;
        cell.bID = businesses[indexPath.row].id;
        cell.business = businesses[indexPath.row];
        cell.configureView();
        cell.delegate = self;
        cell.index_ = indexPath.row;
    }
    return cell;
    }
}

extension BusinessesFollowingCollection: UICollectionViewDelegateFlowLayout {
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 310);
    }
}



