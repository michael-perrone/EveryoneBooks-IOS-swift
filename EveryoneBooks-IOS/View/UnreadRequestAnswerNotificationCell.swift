//
//  UnreadAdminNotificationCell.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 8/24/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class UnreadRequestAnswerNotificationCell: RequestAnswerNotificationCell {
    
    func layoutUnreadCell() {
        if let noti = noti {
            if noti.notificationType == "ESID" {
                notiMessage.text = noti.fromName! + " has asked to be added as an employee."
                
            }
            addSubview(closeEnv);
            closeEnv.padLeft(from: leftAnchor, num: 10);
            closeEnv.padTop(from: topAnchor, num: 33);
        }
    }
}
