//
//  BusinessSearchCollection.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/21/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

protocol CollectionViewCellDelegate: BusinessSearchCollection {
    func showBusiness(bpId: String)
    func followBusiness(index: Int)
    func unFollowBusiness(index: Int)
}

class BusinessSearchCollection: UICollectionViewController, CollectionViewCellDelegate  {
    
    func showBusiness(bpId: String) {
        let bpController = BusinessPageController();
        bpController.businessId = bpId;
        let nav = UINavigationController(rootViewController: bpController);
        nav.modalPresentationStyle = .fullScreen;
        nav.modalTransitionStyle = .crossDissolve;
        self.present(nav, animated: true, completion: nil);
    }
    
    func followBusiness(index: Int) {
        print(index)
        businessesFollowing?.append(businesses![index]["_id"] as! String);
    }
    
    func unFollowBusiness(index: Int) {
        print(index)
         businessesFollowing?.remove(at: index);
    }
    
    
    
    var businesses: [[String:Any]]? {
        didSet {
            getFollowing()
        }
    }
    
    var businessesFollowing: [String]? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData();
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
   
 
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        collectionView.register(BusinesSearchCell.self, forCellWithReuseIdentifier: "BusinessSearchCell");
        collectionView.backgroundColor = .literGray;
        navigationController?.navigationBar.backgroundColor = .mainLav;
        navigationController?.navigationBar.barTintColor = .mainLav;
        let logoView = UIImageView(image: UIImage(named: "logo-small"));
        logoView.setHeight(height: 36);
        logoView.setWidth(width: 36);
        navigationItem.titleView = logoView;
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: xButton)
    }

    func getFollowing() {
            API().get(url: "http://localhost:4000/api/userProfile/following", headerToSend: Utilities().getToken()) { (res) in
                guard let businessesFollow = res["businessesFollowing"] as? [String] else {return}
                self.businessesFollowing = businessesFollow;
        }
    }
}

extension BusinessSearchCollection {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if let businesses = businesses {
        return businesses.count;
    }
    else {
        return 0;
    }
}

override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BusinessSearchCell", for: indexPath) as! BusinesSearchCell;
    if let businesses = businesses {
        if let businessesFollowing = self.businessesFollowing {
            if businessesFollowing.count == 0 {
                cell.following = false;
            }
            else {
                if businessesFollowing.contains(businesses[indexPath.row]["_id"] as! String)  {
                        cell.following = true;
                    }
                    
                else {
                        cell.following = false;
                }
            }
        }
        
        cell.webText.text = businesses[indexPath.row]["website"] as? String;
        cell.phoneText.text = businesses[indexPath.row]["phoneNumber"] as? String;
        cell.businessName.text = businesses[indexPath.row]["businessName"]! as? String ;
        cell.streetText.text = businesses[indexPath.row]["address"]! as? String;
        cell.cityText.text = businesses[indexPath.row]["city"]! as? String ;
        cell.stateText.text = businesses[indexPath.row]["state"]! as? String ;
        cell.zipText.text = businesses[indexPath.row]["zip"]! as? String;
        let scheduleBack = businesses[indexPath.row]["schedule"] as! [[String:String]];
        cell.schedule = Schedule(dic: scheduleBack);
        cell.bID = businesses[indexPath.row]["_id"] as! String;
        cell.index_ = indexPath.row;
        cell.configureView();
        cell.delegate = self;
    }
    return cell;
    }
}

extension BusinessSearchCollection: UICollectionViewDelegateFlowLayout {
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 310);
    }
}



