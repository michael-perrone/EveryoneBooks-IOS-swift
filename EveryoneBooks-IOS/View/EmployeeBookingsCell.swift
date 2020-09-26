//
//  EmployeeBookingsCell.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 9/3/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class EmployeeBookingsCell: UITableViewCell {

    var booking: Booking? {
        didSet {
            self.serviceNames = self.booking?.serviceNames;
        }
    }
    
    var bct: String? {
           didSet {
               roomAreaText.text = self.bct! + " " + self.booking!.bcn!;
           }
       }
    
    var serviceNames: [String]? {
        didSet {
            serviceNamesTable.services = self.serviceNames;
        }
    }

    private let serviceNamesTable: ServicesTextTable = {
        let stt = ServicesTextTable();
        stt.setHeight(height: 120);
        stt.setWidth(width: fullWidth / 2.1);
        return stt;
    }()
    
    private let bookingTimeText: UITextView = {
        let uitv = Components().createLittleText(text: "");
        return uitv;
    }()
    
    private let cNameText: UITextView = {
        let uitv = Components().createLittleText(text: "");
        uitv.textAlignment = .right;
        return uitv;
    }();
    
    private let roomAreaText = Components().createLittleText(text: "");
    
    private let snt = Components().createLittleText(text:"");
    
    func configureCell() {
        addSubview(serviceNamesTable);
        serviceNamesTable.padLeft(from: leftAnchor, num: 0);
        serviceNamesTable.padTop(from: topAnchor, num: 0);
        addSubview(bookingTimeText);
        bookingTimeText.padRight(from: rightAnchor, num: 10);
        bookingTimeText.padTop(from: topAnchor, num: 2);
        bookingTimeText.text =  booking!.time!;
        cNameText.text = booking!.cName!;
        addSubview(cNameText);
        cNameText.padTop(from: bookingTimeText.bottomAnchor, num: 10);
        cNameText.padRight(from: bookingTimeText.rightAnchor, num: 0);
        cNameText.setWidth(width: fullWidth / 2.1);
        addSubview(roomAreaText);
        roomAreaText.padRight(from: rightAnchor, num: 12);
        roomAreaText.padTop(from: cNameText.bottomAnchor, num: 10);
        roomAreaText.text = "Room 3";
        backgroundColor = .literGray;
    }
}
