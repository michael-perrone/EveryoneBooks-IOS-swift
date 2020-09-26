//
//  BookingCell.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 9/18/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class BookingCell: UITableViewCell {
    
    private var time: String? {
        didSet {
            timeText.text = self.time;
        }
    }
    
 
    private let topBorder = Components().createBorder(height: 0.5, width: fullWidth - 20, color: .black);
    private let bottomBorder = Components().createBorder(height: 0.5, width: fullWidth - 20, color: .black);

    private let timeText: UITextView = {
        let uitv = Components().createSimpleText(text: "");
        uitv.font = .boldSystemFont(ofSize: 18);
        return uitv;
    }()
    
    func setTime(time: String) {
        self.time = time;
    }
    
    func getTime() -> String{
        guard let time = time else {return ""};
        return time;
    }
    
    func configureCell() {
        
        addSubview(topBorder);
        topBorder.padTop(from: topAnchor, num: 0);
        topBorder.centerTo(element: centerXAnchor);
        addSubview(timeText);
        timeText.padTop(from: topAnchor, num: 4);
        timeText.centerTo(element: centerXAnchor);
        addSubview(bottomBorder);
        bottomBorder.padBottom(from: bottomAnchor, num: 0);
        bottomBorder.centerTo(element: centerXAnchor);
        backgroundColor = .literGray;
    }
}
