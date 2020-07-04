//
//  BioController.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/7/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class BioController: UIViewController {

    lazy var leftBarButton: UIButton = {
        let uib = Components().createHelpLeftButton();
        uib.addTarget(self, action: #selector(help), for: .touchUpInside)
        return uib;
    }()
    
    @objc func help() {
        let help = EditBusinessHelp(collectionViewLayout: UICollectionViewFlowLayout());
        help.modalPresentationStyle = .fullScreen;
        self.present(help, animated: true, completion: nil);
    }
    
    @objc func done() {
        self.dismiss(animated: true, completion: nil);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
            // Do any additional setup after loading the view.
        }
        
        func configureView() {
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarButton);
            view.backgroundColor = .mainLav;
            navigationItem.title = "Add/Edit Bio";
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
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
