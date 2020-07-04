//
//  AdminBooking.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/3/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class AdminBookings: UIViewController {
    
    var business: Business? {
        didSet {
            getBookings();
        }
    }
    
    var schedule: Schedule?;
    
    lazy var businessEditButton: UIButton = {
          let uib = Components().createGoToBusinessEdit()
          uib.addTarget(self, action: #selector(editBusiness), for: .touchUpInside);
          return uib;
      }()
      
      @objc func editBusiness() {
          let editBusiness = EditBusinessProfile();
          editBusiness.modalPresentationStyle = .fullScreen;
          self.present(editBusiness, animated: true, completion: nil);
      }


    override func viewDidLoad() {
        super.viewDidLoad();
        navigationItem.title = "Schedule";
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: businessEditButton);
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func getBookings() {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
