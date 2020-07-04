//
//  AdminSchedule.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/3/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class AdminShifts: UIViewController {
    
    var schedule: Schedule?
    
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
        navigationItem.title = "Shifts";
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: businessEditButton);
        super.viewDidLoad()
    }
    

    func configureUI() {
        
    }

}
