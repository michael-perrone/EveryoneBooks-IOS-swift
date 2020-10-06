//
//  SelectionItem.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 10/2/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import Foundation
import UIKit

struct SelectionItem {
    var vc: UIViewController?;
    var title: String?
    var image: UIImage?;
    
    
    init(vc: UIViewController?, title: String, image: UIImage) {
        self.vc = vc;
        self.title = title;
        self.image = image;
    }
}
