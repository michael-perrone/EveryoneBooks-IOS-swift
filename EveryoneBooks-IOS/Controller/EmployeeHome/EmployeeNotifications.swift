//
//  NotificationsController.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/8/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class EmployeeNotifications: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }
    
     @objc func done() {
          self.dismiss(animated: true, completion: nil);
      }
      
      func configureView() {
          navigationItem.title = "My Businesses";
          view.backgroundColor = .literGray;
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
