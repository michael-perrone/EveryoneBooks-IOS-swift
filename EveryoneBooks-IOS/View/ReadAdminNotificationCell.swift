//
//  ReadAdminNotificationCell.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 8/24/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class ReadRequestAnswerNotificationCell: RequestAnswerNotificationCell {
    
    func layoutReadCell() {
        if let noti = noti {
            if noti.notificationType == "ESID" {
                if noti.answer! == true {
                    notiMessage.text = noti.fromName! + " has been added as an employee."
                }
                else {
                    notiMessage.text = noti.fromName! + " was denied from becoming an employee."
                }
                
            }
            addSubview(openEnv);
            openEnv.padLeft(from: leftAnchor, num: 10);
            openEnv.padTop(from: topAnchor, num: 33);
        }
    }
}
