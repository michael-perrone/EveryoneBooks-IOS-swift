//
//  Utils.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 4/21/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class Components {
    
    // MARK: - SIMPLE TEXT
    
    func createBigLogo() -> UIImageView {
        let uiiv = UIImageView();
        uiiv.image = UIImage(named: "logo-big");
        uiiv.backgroundColor = .mainLav;
        return uiiv;
    }
    
    func createLogoText() -> UITextView {
        let uitv = UITextView();
        uitv.text = "Everyone Books";
        uitv.backgroundColor = .mainLav;
        uitv.font = UIFont(name: "ChalkboardSE-Bold", size: 46);
        uitv.textAlignment = .center;
        uitv.isEditable = false;
        uitv.isScrollEnabled = false;
        return uitv;
    }
    
    func createSimpleText(text: String) -> UITextView {
        let uitv = UITextView();
        uitv.isEditable = false;
        uitv.isScrollEnabled = false;
        uitv.text = text;
        uitv.font = .systemFont(ofSize: 22);
        uitv.backgroundColor = .literGray;
        return uitv;
    }
    
    func createCancelButton(height: CGFloat, width: CGFloat) -> UIButton {
        let uib = UIButton(type: .system);
        uib.setTitle("Close", for: .normal)
        uib.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 20);
        uib.setHeight(height: height);
        uib.setWidth(width: width);
        uib.backgroundColor = .darkGray;
        uib.tintColor = .mainLav;
        uib.layer.cornerRadius = height / 4;
        uib.layer.borderColor = .CGBlack;
        return uib;
    }
    
    // MARK: - TEXT FIELD INSIDE INPUT
    
    func createTextField(placeHolder: String, fontSize: CGFloat) -> UITextField {
        let uitf = UITextField();
        uitf.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray] )
        uitf.font = .systemFont(ofSize: fontSize)
        return uitf;
    }
    
    
    // MARK: - INPUT
    func createInput( textField: UITextField, view: UIView, typeOfInput: String? = nil, width: CGFloat? = nil) -> UIView {
        let uiv = UIView();
        let bottomBorder = UIView();
        uiv.setHeight(height: 35);
        if let width = width {
            uiv.setWidth(width: width)
            bottomBorder.setWidth(width: width)
        } else {
            uiv.setWidth(width: view.frame.width / 1.3);
            bottomBorder.setWidth(width: view.frame.width / 1.3);
        }
        uiv.backgroundColor = .clear;
        
        bottomBorder.setHeight(height: 2);
        bottomBorder.backgroundColor = .black;
        uiv.addSubview(bottomBorder);
        uiv.addSubview(textField);
        textField.padBottom(from: uiv.bottomAnchor, num: 4);
        textField.padLeft(from: uiv.leftAnchor, num: 4);
        textField.padRight(from: uiv.rightAnchor, num: 4);
        bottomBorder.padLeft(from: uiv.leftAnchor, num: 0);
        bottomBorder.padTop(from: textField.bottomAnchor, num: 0);
        return uiv;
    }
    
    // MARK: - CREATE QUESTION BUTTON
    func createQuestionButton() -> UIButton {
        let uib = UIButton(type: .system);
         uib.setTitle("?", for: .normal);
         uib.layer.borderColor = CGColor.init(srgbRed: 0, green: 0, blue: 0, alpha: 1);
         uib.layer.borderWidth = 3.0;
         uib.setHeight(height: 60);
         uib.setWidth(width: 60);
         uib.titleLabel?.font = UIFont.boldSystemFont(ofSize: 42);
         uib.layer.cornerRadius = 30.0;
         return uib;
    }
    
    
    // MARK: - FRONT PAGE LOGIN SCREEN BUTTONS
    
    
    func createFrontButtons(title: String, view: UIView) -> UIButton {
        let frontButton = UIButton(type: .system);
        frontButton.setTitle(title, for: .normal);
        frontButton.titleLabel?.font = UIFont(name: "ChalkboardSE-Bold", size: 24)
        frontButton.setHeight(height: 50);
        frontButton.setWidth(width: view.frame.width / 1.3);
        frontButton.layer.borderColor = CGColor(srgbRed: 0.4, green: 0.4, blue: 0.4, alpha: 1);
        frontButton.layer.borderWidth = 2.0;
        frontButton.layer.cornerRadius = 6;
        frontButton.backgroundColor = .white;
        frontButton.setTitleColor(.black, for: .normal);
        return frontButton;
    }
    
    func createRightButton(title: String) -> UIButton {
        let uib = UIButton(type: .system);
        uib.setAttributedTitle(NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Wide", size: 30)]), for: .normal);
        uib.tintColor = .black;
        return uib;
    }
    
    // MARK: - WHITE BUTTONS LOGIN/REGISTER
    
    func createNormalButton(title: String) -> UIButton {
        let loginButton = UIButton(type: .system);
        loginButton.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1);
        loginButton.layer.borderWidth = 2.0;
        loginButton.backgroundColor = .white;
        loginButton.setTitle(title, for: .normal);
        loginButton.tintColor = .black;
        loginButton.layer.cornerRadius = 2;
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 22);
        return loginButton;
    }
    
    func createXButton() -> UIButton {
        let uib = UIButton(type: .system);
        uib.setAttributedTitle(NSAttributedString(string: "X", attributes: [NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Wide", size: 38)]), for: .normal);
        uib.tintColor = .black;
        return uib;
    }
    
    func createAlternateButton(title: String) -> UIButton {
           let loginButton = UIButton(type: .system);
           loginButton.backgroundColor = .mainLav;
           loginButton.setTitle(title, for: .normal);
           loginButton.tintColor = .black;
           loginButton.layer.cornerRadius = 6;
           loginButton.titleLabel?.font = .boldSystemFont(ofSize: 22);
            
           return loginButton;
       }
    
    // MARK: - BACK BUTTON ARROW IMAGE
    
    func createBackButton() -> UIButton {
        let undoButton = UIButton(type: .system);
        undoButton.setImage(UIImage(named: "undo"), for: .normal);
        undoButton.tintColor = .black;
        return undoButton;
    }
    
    // MARK: - ERROR TEXT
    
    func createError(view: UIView) -> UITextView {
        let uitv = UITextView();
        uitv.font = .systemFont(ofSize: 18);
        uitv.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1);
        uitv.backgroundColor = .mainLav;
        uitv.text = "";
        uitv.isScrollEnabled = false;
        uitv.isEditable = false;
        uitv.setWidth(width: view.frame.width);
        uitv.textAlignment = .center;
        return uitv;
    }
    
    // MARK: - NAVBARITEM
    
    func createNavBarItemController(image: UIImage?, viewController: UIViewController, title: String) -> UINavigationController {
        let navBarItem = UINavigationController(rootViewController: viewController);
        navBarItem.tabBarItem.image = image;
        navBarItem.title = title;
        return navBarItem;
    }
    
    // MARK: - BARITEM
    
    func createBarItemController(image: UIImage?, viewController: UIViewController, title: String) -> UIViewController {
        let barItem = viewController;
        barItem.tabBarItem.image = image;
        barItem.title = title;
        return barItem;
    }
    
    // MARK: - Help Details
    
    func createHelpDetails(text: String) -> UITextView {
        let uitv = UITextView();
        uitv.text = text;
        uitv.font = .systemFont(ofSize: 18);
        uitv.isEditable = false;
        uitv.isScrollEnabled = false;
        uitv.backgroundColor = .mainLav;
        return uitv;
    }
    
    func createBorder(view: UIView) -> UIView {
        let uiv = UIView();
        uiv.setWidth(width: view.frame.width);
        uiv.setHeight(height: 2);
        uiv.backgroundColor = .black;
        return uiv;
    }
    
    func createLittleGuy() -> UIImageView {
        let uiiv = UIImageView();
        uiiv.image = UIImage(named: "logo-small");
        uiiv.setHeight(height: 30);
        uiiv.setWidth(width: 30);
        return uiiv;
    }
    
    
    func createGoToBusinessEdit() -> UIButton {
        let uib = UIButton(type: .system);
        uib.setAttributedTitle(NSAttributedString(string: "Edit Business", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)]), for: .normal)
        uib.setHeight(height: 30);
        uib.setWidth(width: 100);
        return uib;
    }
    
    func createWhiteUIView(width: CGFloat, height: CGFloat) -> UIView {
        let uiv = UIView();
        uiv.setWidth(width: UIScreen.main.bounds.width / width);
        uiv.setHeight(height: UIScreen.main.bounds.height /  height);
        uiv.layer.borderColor = .CGBlack;
        uiv.layer.borderWidth = 2.0;
        uiv.backgroundColor = .white;
        return uiv;
    }
    
    func createHelpLeftButton() -> UIButton {
        let uib = UIButton(type: .system);
        uib.setAttributedTitle(NSAttributedString(string: "Help", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]), for: .normal);
        uib.setWidth(width: 50);
        uib.setHeight(height: 30);
        return uib;
    }
    
    func createTableToggleButtons(title: String) -> UIButton {
        let uib = UIButton(type: .system);
        uib.setAttributedTitle(NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]), for: .normal);
        uib.backgroundColor = .mainLav;
        uib.layer.borderWidth = 2.0;
        uib.layer.borderColor = .CGBlack;
        uib.setWidth(width: UIScreen.main.bounds.width / 2.06);
        uib.setHeight(height: 48);
        return uib;
    }
    
    func createSuccess(text: String) -> UIView {
        let uiv = UIView();
        let uiiv = UIImageView();
        uiiv.image = UIImage(named: "suc");
        uiv.setWidth(width: UIScreen.main.bounds.width);
        let uitv = createSimpleText(text: text);
        uiv.setHeight(height: 50);
        uiv.addSubview(uiiv);
        uiiv.setHeight(height: 40);
        uiiv.setWidth(width: 40);
        uiv.addSubview(uitv);
        uitv.padTop(from: uiv.topAnchor, num: 2);
        uitv.centerTo(element: uiv.centerXAnchor);
        uiiv.padRight(from: uitv.leftAnchor, num: 4);
        return uiv;
    }
}
