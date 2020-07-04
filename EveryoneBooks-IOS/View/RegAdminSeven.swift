//
//  RegAdminSeven.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 5/30/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class RegAdminSeven: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let bookingThingText: UITextView = {
        let uitv = Components().createSimpleText(text: "Item/Area Being Booked");
        uitv.backgroundColor = .mainLav;
        return uitv
    }()
    
    private let bookingThingTextField: UITextField = {
        let uitf = Components().createTextField(placeHolder: "Item/Area for Booking", fontSize: 22.0);
        return uitf;
    }()
    
    lazy var bookingThingInput: UIView = {
        let uiv = Components().createInput(textField: bookingThingTextField, view: self, typeOfInput: nil, width: UIScreen.main.bounds.width / 1.3)
        return uiv;
    }()

    private let bookingThingNumberText: UITextView = {
        let uitv = Components().createSimpleText(text: "Num of Items/Areas Being Booked");
        uitv.backgroundColor = .mainLav;
        return uitv;
    }()
    
    private let bookingItemPicker: BookingItemPicker = {
        let bip = BookingItemPicker();
        return bip;
    }()
    
    func getBookingColumnType() -> String? {
        return bookingThingTextField.text;
    }
    
    func getBookingColumnNumber() -> String? {
        return bookingItemPicker.selected;
    }
    
    func configureView() {
        addSubview(bookingThingText);
        bookingThingText.padTop(from: topAnchor, num: 10);
        bookingThingText.centerTo(element: centerXAnchor);
        
        addSubview(bookingThingInput);
        bookingThingInput.padTop(from: bookingThingText.bottomAnchor, num: 10);
        bookingThingInput.centerTo(element: centerXAnchor);
        
        addSubview(bookingThingNumberText);
        bookingThingNumberText.padTop(from: bookingThingInput.bottomAnchor, num: 50);
        bookingThingNumberText.centerTo(element: centerXAnchor);
        
        addSubview(bookingItemPicker);
        bookingItemPicker.padTop(from: bookingThingNumberText.bottomAnchor, num: 10);
        bookingItemPicker.centerTo(element: centerXAnchor);
        bookingItemPicker.setHeight(height: 90);
        bookingItemPicker.setWidth(width: 130);
    }
}
