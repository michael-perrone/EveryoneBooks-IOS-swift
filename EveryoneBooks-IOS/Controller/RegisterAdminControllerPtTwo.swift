//
//  RegisterAdminControllerPtTwo.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 4/24/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class RegisterAdminControllerPtTwo: UIViewController {
    
    var locationInfoEntered: Bool = false;
    var otherInfoAdded: Bool = false;
    var thingBookingEntered: Bool = false;
    var numberThingBookingEntered: Bool = false;
    var adminInfoEntered: Bool = false;
    var weekendEntered: Bool = false;
    // MARK: - Incoming props
    
    var firstName = "";
    var lastName = "";
    var typeOfBusiness = "";
    var businessName = "";
    var street = "";
    var city = "";
    var state = "";
    var zip = "";
    var phone = "";
    var website = "";
    var thingBooked = "";
    var thingBookedNum = "";
    var email = "";
    var password = "";
    var sunOpen = "Closed";
    var sunClose = "Closed";
    var satOpen = "Closed";
    var satClose = "Closed";
    var monOpen = "Closed";
    var monClose = "Closed";
    var tueOpen = "Closed";
    var tueClose = "Closed";
    var wedOpen = "Closed";
    var wedClose = "Closed";
    var thuOpen = "Closed";
    var thuClose = "Closed";
    var friOpen = "Closed";
    var friClose = "Closed";

    
    
    // MARK: - PROPERTIES
    
    lazy var error: UITextView = {
        let uitv = Utils().createError(view: view);
        return uitv;
    }();
    
    private let backButton: UIButton = {
        let uib = Utils().createBackButton();
        uib.addTarget(self, action: #selector(goBack), for: .touchUpInside);
        return uib;
    }()
    
    
    private let progress: UIProgressView = {
        let uip = UIProgressView();
        uip.progress = 0.05;
        uip.trackTintColor = .white;
        uip.progressTintColor = .gray;
        return uip;
       }()
    
    private let nextButton: UIButton = {
        let uib = Utils().createNormalButton(title: "Next");
        uib.titleLabel?.font = .boldSystemFont(ofSize: 22);
        uib.addTarget(self, action: #selector(nextHit), for: .touchUpInside)
        return uib;
    }()
    
    
    // MARK: Business Location Props
    
    private let streetTextField: UITextField = {
        let uitf = UITextField();
        uitf.attributedPlaceholder = NSAttributedString(string: "Street/Road and Number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]);
        uitf.returnKeyType = .next;
        uitf.textColor = .black;
        return uitf;
    }()
    
    private let cityTextField: UITextField = {
        let uitf = UITextField();
        uitf.attributedPlaceholder = NSAttributedString(string: "City", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]);
        uitf.returnKeyType = .next;
        uitf.textColor = .black;
        return uitf;
    }()
    
    private let stateTextField: UITextField = {
        let uitf = UITextField();
        uitf.attributedPlaceholder = NSAttributedString(string: "State", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]);
        uitf.returnKeyType = .next;
        uitf.textColor = .black;
        return uitf;
    }()
    private let zipTextField: UITextField = {
        let uitf = UITextField();
        uitf.attributedPlaceholder = NSAttributedString(string: "Zipcode", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]);
        uitf.returnKeyType = .next;
        uitf.textColor = .black;
        return uitf;
    }()
    
    
    lazy var streetInput: UIView = {
        let uiv = Utils().createInput(textField: streetTextField, view: view);
        return uiv;
    }()
    
    lazy var cityInput: UIView = {
        let uiv = Utils().createInput(textField: cityTextField, view: view);
        return uiv;
    }()
    
    lazy var stateInput: UIView = {
        let uiv = Utils().createInput(textField: stateTextField, view: view);
        return uiv;
    }()
    
    lazy var zipInput: UIView = {
        let uiv = Utils().createInput(textField: zipTextField, view: view);
        return uiv;
    }()
    
    private let businessLocationText: UITextView = {
        let uitv = Utils().createSmallText(text: "Business Location: ");
        return uitv;
    }()
    
    
    
    // MARK: - Other Business Info PRops
    
    private let otherBusinessInfoText: UITextView = {
        let uitv = Utils().createSmallText(text: "Other Bussines Info:")
        return uitv;
    }()
    
    private let businessPhoneText: UITextField = {
        let uitf = UITextField();
        uitf.attributedPlaceholder = NSAttributedString(string: "Business Phone", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        uitf.returnKeyType = .next;
        uitf.textColor = .black;
        return uitf;
    }()
    
    lazy var businessPhoneInput: UIView = {
        let uiv = Utils().createInput(textField: businessPhoneText, view: view);
        return uiv;
    }()
    
    private let businessWebsiteText: UITextField = {
        let uitf = UITextField();
        uitf.attributedPlaceholder = NSAttributedString(string: "Business Website", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        uitf.returnKeyType = .next;
        uitf.textColor = .black;
        return uitf;
    }()
    
    lazy var businessWebInput: UIView = {
        let uiv = Utils().createInput(textField: businessWebsiteText, view: view);
        return uiv;
    }()
    
    private let optionalText: UITextView = {
        let uitv = Utils().createSmallerText(text: "Note: The fields above are optional");
        
        return uitv;
    }()
    
    
    // MARK: - What to Book on
    
    private let explanationText: UITextView = {
        let uitv = UITextView();
        uitv.isScrollEnabled = false;
        uitv.isEditable = false;
        uitv.backgroundColor = .mainLav;
        uitv.font = .systemFont(ofSize: 18);
        uitv.text = "Please fill in below what type of area your business will be booking. For example: at a restaurant table may be booked, at a tattoo studio a chair may be booked, and at a wax center or massage parlor a room may be booked.";
        uitv.textColor = .black;
        return uitv;
    }()
    
    private let thingTextField: UITextField = {
        let uitf = UITextField();
        uitf.attributedPlaceholder = NSAttributedString(string: "Room/chair/table/office etc.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        uitf.returnKeyType = .next;
        uitf.textColor = .black;
        return uitf;
    }()
    
    
    lazy var thingInput: UIView = {
        let uiv = Utils().createInput(textField: thingTextField, view: view);
        return uiv;
    }()
    
    // MARK: - Number Of Things
    
    lazy var numberThingsText: UITextView = {
        let uitv = Utils().createSmallerText(text: "");
        return uitv;
    }()
    
    private let numberThingsTextField: UITextField = {
        let uitf = UITextField();
        uitf.attributedPlaceholder = NSAttributedString(string: "Number 1-100", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        uitf.returnKeyType = .next;
        uitf.textColor = .black;
        return uitf;
    }()
    
    lazy var numberThingsInput: UIView = {
        let uiv = Utils().createInput(textField: numberThingsTextField, view: view);
        return uiv;
    }()
    
    // MARK: ADMINFO
    
    private let firstNameTextField: UITextField = {
        let uitf = UITextField();
        uitf.textColor = .black;
        uitf.attributedPlaceholder = NSAttributedString(string: "First Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]);
        uitf.returnKeyType = .next;
        uitf.textColor = .black;
        return uitf;
    }()
    
    lazy var firstNameInput: UIView = {
        let uiv = Utils().createInput(image: UIImage(named: "person"), textField: firstNameTextField, view: view, typeOfInput: nil);
        return uiv;
    }()
    
    private let lastNameTextField: UITextField = {
        let uitf = UITextField();
        uitf.textColor = .black;
        uitf.attributedPlaceholder = NSAttributedString(string: "Last Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]);
        uitf.returnKeyType = .next;
        uitf.textColor = .black;
        return uitf;
    }()
    
    lazy var lastNameInput: UIView = {
        let uiv = Utils().createInput(image: UIImage(named: "person"), textField: lastNameTextField, view: view, typeOfInput: nil);
        return uiv;
    }()
    
    private let emailLoginText: UITextField = {
        let uitf = UITextField();
        uitf.textColor = .black;
        uitf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        uitf.returnKeyType = .next;
        uitf.textColor = .black;
        return uitf;
    }()
    
    private let passwordLoginText: UITextField = {
        let uitf = UITextField();
        uitf.textColor = .black;
        uitf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        uitf.isSecureTextEntry = true;
        uitf.returnKeyType = .next;
        uitf.textColor = .black;
        return uitf;
    }()
    
    lazy var loginInput: UIView = {
        let uiv = Utils().createInput(image: UIImage(named: "-mail-24"), textField: emailLoginText, view: view, typeOfInput: "mail")
        return uiv;
    }()
    
    lazy var passwordInput: UIView = {
        let uiv = Utils().createInput(image: UIImage(named: "pw"), textField: passwordLoginText, view: view, typeOfInput: "lock")
        return uiv;
    }()
    
    private let confirmPasswordLoginText: UITextField = {
        let uitf = UITextField();
        uitf.textColor = .black;
        uitf.attributedPlaceholder = NSAttributedString(string: "Confirm Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        uitf.isSecureTextEntry = true;
        uitf.returnKeyType = .next;
        uitf.textColor = .black;
        return uitf;
    }()
    
    lazy var confirmPasswordInput: UIView = {
        let uiv = Utils().createInput(image: UIImage(named: "pw"), textField: confirmPasswordLoginText, view: view, typeOfInput: "lock")
        return uiv;
    }()
    
    private let adminAccountText: UITextView = {
        let uitv = Utils().createSmallText(text: "Create Admin Account: ")
        return uitv;
    }()
    
    // MARK: Schedule
    
    lazy var border1: UIView = {
        let uiv = Utils().createBottomBorder(view: view);
        return uiv;
    }()
    
    lazy var border2: UIView = {
        let uiv = Utils().createBottomBorder(view: view);
        return uiv;
    }()
    
    lazy var border3: UIView = {
        let uiv = Utils().createBottomBorder(view: view);
        return uiv;
    }()
    
    lazy var border4: UIView = {
        let uiv = Utils().createBottomBorder(view: view);
        return uiv;
    }()
    
    lazy var border5: UIView = {
        let uiv = Utils().createBottomBorder(view: view);
        return uiv;
    }()
    
    private let open1: TimeDrop = {
        let td = TimeDrop();
        return td;
    }()
    
    private let close1: TimeDrop = {
        let td = TimeDrop();
        return td;
    }()
    
    private let open2: TimeDrop = {
        let td = TimeDrop();
        return td;
    }()
    
    private let close2: TimeDrop = {
        let td = TimeDrop();
        return td;
    }()
    
    private let open3: TimeDrop = {
          let td = TimeDrop();
          return td;
    }()
      
    private let close3: TimeDrop = {
          let td = TimeDrop();
          return td;
    }()
      
    private let open4: TimeDrop = {
          let td = TimeDrop();
          return td;
    }()
      
    private let close4: TimeDrop = {
          let td = TimeDrop();
          return td;
    }()
    
    private let open5: TimeDrop = {
        let td = TimeDrop();
        return td;
    }()
    
    private let close5: TimeDrop = {
        let td = TimeDrop();
        return td;
    }()
    
    private let open6: TimeDrop = {
        let td = TimeDrop();
        return td;
    }()
    
    private let close6: TimeDrop = {
        let td = TimeDrop();
        return td;
    }()
    
    private let open7: TimeDrop = {
        let td = TimeDrop();
        return td;
    }()
    
    private let close7: TimeDrop = {
        let td = TimeDrop();
        return td;
    }()
    
    private let sunText: UITextView = {
        let uitv = Utils().createSmallText(text: "Sun:");
        uitv.textAlignment = .center;
        return uitv;
    }()
    
    private let monText: UITextView = {
        let uitv = Utils().createSmallText(text: "Mon:");
        uitv.textAlignment = .center;
        return uitv;
    }()
    
    private let tueText: UITextView = {
        let uitv = Utils().createSmallText(text: "Tue:");
        uitv.textAlignment = .center;
        return uitv;
    }()
    
    private let wedText: UITextView = {
        let uitv = Utils().createSmallText(text: "Wed:");
        uitv.textAlignment = .center;
        return uitv;
    }()
    
    private let thuText: UITextView = {
        let uitv = Utils().createSmallText(text: "Thu:");
        uitv.textAlignment = .center;
        return uitv;
    }()
    
    private let friText: UITextView = {
        let uitv = Utils().createSmallText(text: "Fri:");
        uitv.textAlignment = .center;
        return uitv;
    }()
    
    private let satText: UITextView = {
        let uitv = Utils().createSmallText(text: "Sat:");
        uitv.textAlignment = .center;
        return uitv;
    }()
    
    
    lazy var stack1: UIStackView = {
        let stack = Utils().createTimeStack(open: open1, close: close1, day: sunText);
        stack.alignment = .center;
        return stack;
    }()
    
    lazy var stack2: UIStackView = {
        let stack = Utils().createTimeStack(open: open2, close: close2, day: monText);
        return stack;
    }()
    
    lazy var stack3: UIStackView = {
        let stack = Utils().createTimeStack(open: open3, close: close3, day: tueText);
        return stack;
    }()
    
    lazy var stack4: UIStackView = {
        let stack = Utils().createTimeStack(open: open4, close: close4, day: wedText);
        return stack;
    }()
    
    lazy var stack5: UIStackView = {
        let stack = Utils().createTimeStack(open: open5, close: close5, day: thuText);
        return stack;
    }()
    
    lazy var stack6: UIStackView = {
        let stack = Utils().createTimeStack(open: open6, close: close6, day: friText);
        return stack;
    }()
       
    lazy var stack7: UIStackView = {
        let stack = Utils().createTimeStack(open: open7, close: close7, day: satText);
        return stack;
    }()
    
    private let introScheduleText2: UITextView = {
        let uitv = UITextView();
        uitv.text = "Enter business schedule for each WEEKDAY. If closed on certain day, leave both dropdowns unchanged. Note: The first dropdown is the time of business open and second is the time of business close for each day."
        uitv.isScrollEnabled = false;
        uitv.backgroundColor = .green;
        uitv.isEditable = false;
        uitv.backgroundColor = .mainLav;
        uitv.font = .systemFont(ofSize: 18);
        uitv.textColor = .black;
        return uitv;
    }()
    
    private let introScheduleText1: UITextView = {
          let uitv = UITextView();
          uitv.text = "Enter business schedule for each WEEKEND. If closed on certain day, leave both dropdowns unchanged. Note: The first dropdown is the time of business open and second is the time of business close for day listed."
          uitv.isScrollEnabled = false;
          uitv.isEditable = false;
        uitv.textColor = .black;
        uitv.setHeight(height: 160)
        uitv.backgroundColor = .mainLav;
          uitv.font = .systemFont(ofSize: 18);
          return uitv;
      }()
    
    // MARK: SELECTOR
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true);
    }
    
    func locationInfoEnteredFunction() {
        if streetTextField.text != "" && cityTextField.text != "" && zipTextField.text != "" && stateTextField.text != "" {
            firstName = firstNameTextField.text!;
            lastName = lastNameTextField.text!;
            state = stateTextField.text!;
            city = cityTextField.text!;
            street = streetTextField.text!;
            zip = zipTextField.text!;
            locationInfoEntered = true;
            progress.progress = 0.15;
            streetInput.isHidden = true;
            cityInput.isHidden = true;
            zipInput.isHidden = true;
            stateInput.isHidden = true;
            businessLocationText.isHidden = true;
            businessWebInput.isHidden = false;
            businessPhoneInput.isHidden = false;
            optionalText.isHidden = false;
            otherBusinessInfoText.isHidden = false;
            setErrorText(text: "");
        }
        else {
           setErrorText(text: "The fields above are required.")
        }
    }
    
    @objc func nextHit() {
        if !locationInfoEntered {
            locationInfoEnteredFunction()
        }
        else if !otherInfoAdded {
            otherInfoAdded = true;
            phone = businessPhoneText.text!;
            website = businessWebsiteText.text!;
            businessPhoneInput.isHidden = true;
            businessWebInput.isHidden = true;
            progress.progress = 0.3;
            explanationText.isHidden = false;
            optionalText.isHidden = true;
            otherBusinessInfoText.isHidden = true;
            thingInput.isHidden = false;
            
        }
        else if !thingBookingEntered {
            if thingTextField.text != "" {
            thingBooked = thingTextField.text!;
            thingBookingEntered = true;
            thingInput.isHidden = true;
            explanationText.isHidden = true;
            progress.progress = 0.45;
            numberThingsText.text = "How many " + thingBooked + "\'s does your business have available for booking? Please note this number must be from 1-100.";
            numberThingsText.isHidden = false;
            numberThingsInput.isHidden = false;
            setErrorText(text: "");
            }
            else {
                setErrorText(text: "Please enter the area for bookings.");
            }
            }
        else if !numberThingBookingEntered {
            if numberThingsTextField.text != "" {
            numberThingBookingEntered = true;
            thingBookedNum = numberThingsTextField.text!;
            adminAccountText.isHidden = false;
            loginInput.isHidden = false;
            passwordInput.isHidden = false;
            confirmPasswordInput.isHidden = false;
            numberThingsText.isHidden = true;
            numberThingsInput.isHidden = true;
            progress.progress = 0.6;
            setErrorText(text: "");
            }
            else {
                setErrorText(text: "Please enter the numbero of " + thingBooked + "\'s");
            }
        }
        else if !adminInfoEntered  {
            if emailLoginText.text != "" && passwordLoginText.text != "" && confirmPasswordLoginText.text != "" {
                if confirmPasswordLoginText.text! == passwordLoginText.text! {
            adminAccountText.isHidden = true;
            adminInfoEntered = true;
            loginInput.isHidden = true;
            passwordInput.isHidden = true;
            confirmPasswordInput.isHidden = true;
            stack1.isHidden = false;
            border1.isHidden = false;
            stack7.isHidden = false;
            border1.isHidden = false;
            email = emailLoginText.text!;
            password = passwordLoginText.text!;
            progress.progress = 0.75;
            introScheduleText1.isHidden = false;
            setErrorText(text: "");
            nextButton.padTop(from: stack1.bottomAnchor, num: 30);
                }
                else {
                    setErrorText(text: "Passwords do not match.");
                }
            }
            else {
                setErrorText(text: "The above fields are required.");
            }
        }
        else if !weekendEntered {
            weekendEntered = true;
            stack1.isHidden = true;
            sunOpen = open1.selected;
            sunClose = close1.selected;
            satOpen = open7.selected;
            satClose = close7.selected;
            stack7.isHidden = true;
            stack2.isHidden = false;
            stack3.isHidden = false;
            stack4.isHidden = false;
            stack5.isHidden = false;
            stack6.isHidden = false;
            border2.isHidden = false;
            border3.isHidden = false;
            border4.isHidden = false;
            introScheduleText2.isHidden = false;
            progress.progress = 0.9;
            nextButton.padTop(from: stack6.bottomAnchor, num: 40);
        }
        
        else {
            monOpen = open2.selected;
            monClose = close2.selected;
            tueOpen = open3.selected;
            tueClose = close3.selected;
            wedOpen = open4.selected;
            wedClose = close4.selected;
            thuOpen = open5.selected;
            thuClose = close5.selected;
            friOpen = open6.selected;
            friClose = close6.selected;
            
            registerBusiness { (status) in
                print(status)
            }
        }
    }
    
    // MARK: Lifecycle
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        streetTextField.delegate = self;
        cityTextField.delegate = self;
        zipTextField.delegate = self;
        stateTextField.delegate = self;
        businessPhoneText.delegate = self;
        businessWebsiteText.delegate = self;
        thingTextField.delegate = self;
        numberThingsTextField.delegate = self;
        configureUI()
    }
    
    // MARK: Helper
    
    
    func configureUI() {
        
        
        numberThingsText.isHidden = true;
        explanationText.isHidden = true;
        businessPhoneInput.isHidden = true;
        businessWebInput.isHidden = true;
        optionalText.isHidden = true;
        otherBusinessInfoText.isHidden = true;
        thingInput.isHidden = true;
        
        view.backgroundColor = .mainLav;
        
        view.addSubview(backButton);
        backButton.padTop(from: view.safeAreaLayoutGuide.topAnchor, num: 10);
        backButton.padLeft(from: view.leftAnchor, num: 10);
        
        view.addSubview(progress);
        progress.padTop(from: view.safeAreaLayoutGuide.topAnchor, num: 22);
        progress.padLeft(from: backButton.rightAnchor, num: 20);
        progress.setWidth(width: view.frame.width - view.frame.width / 2.7);
        progress.setHeight(height: 18);
        
        
        // MARK: BUSINESS LOCATION
        
        
        view.addSubview(businessLocationText);
        businessLocationText.centerTo(element: view.centerXAnchor);
        businessLocationText.padTop(from: progress.bottomAnchor, num: 30);
        
        
        view.addSubview(streetInput);
        streetInput.padTop(from: businessLocationText.bottomAnchor, num: 20);
        streetInput.centerTo(element: view.centerXAnchor);
        
        view.addSubview(cityInput);
        cityInput.padTop(from: streetInput.bottomAnchor, num: 15);
        cityInput.centerTo(element: view.centerXAnchor);
        
        view.addSubview(stateInput);
        stateInput.padTop(from: cityInput.bottomAnchor, num: 15);
        stateInput.centerTo(element: view.centerXAnchor);
        
        view.addSubview(zipInput);
        zipInput.padTop(from: stateInput.bottomAnchor, num: 15);
        zipInput.centerTo(element: view.centerXAnchor);
        
        
        // MARK: EXTRA BUSINESSINFO
        
        view.addSubview(otherBusinessInfoText);
        otherBusinessInfoText.centerTo(element: view.centerXAnchor);
        otherBusinessInfoText.padTop(from: progress.bottomAnchor, num: 30 );
        
        view.addSubview(businessPhoneInput);
        businessPhoneInput.padTop(from: otherBusinessInfoText.bottomAnchor, num: 20);
        businessPhoneInput.centerTo(element: view.centerXAnchor);
               
        view.addSubview(businessWebInput);
            businessWebInput.padTop(from: businessPhoneInput.bottomAnchor, num: 30);
            businessWebInput.centerTo(element: view.centerXAnchor);
        
        view.addSubview(optionalText);
        optionalText.padTop(from: businessWebInput.bottomAnchor, num: 20);
        optionalText.centerTo(element: view.centerXAnchor);
        
        
        view.addSubview(nextButton);
        nextButton.padTop(from: zipInput.bottomAnchor, num: 30);
        nextButton.centerTo(element: view.centerXAnchor);
        nextButton.setWidth(width: 140);
        nextButton.setHeight(height: 60)
        
        view.addSubview(explanationText);
        explanationText.centerTo(element: view.centerXAnchor);
        explanationText.padTop(from: progress.bottomAnchor, num: 25);
        explanationText.setHeight(height: 145);
        explanationText.setWidth(width: view.frame.width / 1.2);
        view.addSubview(thingInput);
        thingInput.centerTo(element: view.centerXAnchor);
        thingInput.padTop(from: explanationText.bottomAnchor, num: 30);
        
        view.addSubview(numberThingsText);
        numberThingsText.centerTo(element: view.centerXAnchor);
        numberThingsText.padTop(from: progress.bottomAnchor, num: 30);
        numberThingsText.setHeight(height: 120);
        numberThingsText.setWidth(width: view.frame.width / 1.3)
        view.addSubview(numberThingsInput);
        numberThingsInput.padTop(from: numberThingsText.bottomAnchor, num: 30);
        numberThingsInput.centerTo(element: view.centerXAnchor);
        numberThingsInput.isHidden = true;
        
        
        
        // MARK: - ADMIN INFO LAYOUT
        
        view.addSubview(adminAccountText);
        adminAccountText.centerTo(element: view.centerXAnchor);
        adminAccountText.padTop(from: progress.bottomAnchor, num: 20)
        adminAccountText.isHidden = true;
        
        
        view.addSubview(loginInput);
        loginInput.centerTo(element: view.centerXAnchor);
        loginInput.padTop(from: adminAccountText.bottomAnchor, num: 20);
        loginInput.isHidden = true;
        
        view.addSubview(passwordInput);
        passwordInput.centerTo(element: view.centerXAnchor);
        passwordInput.padTop(from: loginInput.bottomAnchor, num: 20);
        passwordInput.isHidden = true;
        
        view.addSubview(confirmPasswordInput);
        confirmPasswordInput.centerTo(element: view.centerXAnchor);
        confirmPasswordInput.padTop(from: passwordInput.bottomAnchor, num: 20);
        confirmPasswordInput.isHidden = true;
        
        
        // MARK:  SCHEDULE
        
    
    
        
        view.addSubview(introScheduleText2);
        introScheduleText2.isHidden = true;
        introScheduleText2.centerTo(element: view.centerXAnchor);
        introScheduleText2.padTop(from: progress.bottomAnchor, num: 45);
        introScheduleText2.setWidth(width: view.frame.width / 1.2);
        
      
        view.addSubview(introScheduleText1);
        introScheduleText1.isHidden = true;
        introScheduleText1.centerTo(element: view.centerXAnchor);
        introScheduleText1.padTop(from: view.safeAreaLayoutGuide.topAnchor, num: 65);
        introScheduleText1.setWidth(width: view.frame.width / 1.2);
        
        view.addSubview(stack7);
        stack7.isHidden = true;
        stack7.setWidth(width: view.frame.width / 1);
        stack7.centerTo(element: view.centerXAnchor);
        stack7.padTop(from: introScheduleText1.bottomAnchor, num: 35 );
        stack7.setHeight(height: 45)
              

       
        view.addSubview(stack2);
        stack2.isHidden = true;
        stack2.setWidth(width: view.frame.width / 1);
        stack2.centerTo(element: view.centerXAnchor);
        stack2.padTop(from: introScheduleText2.bottomAnchor, num: 30 );
        stack2.setHeight(height: 45)
        
        view.addSubview(border1);
        border1.isHidden = true;
        border1.centerTo(element: view.centerXAnchor);
        border1.padTop(from: stack2.bottomAnchor, num: 5);
        
        
        view.addSubview(stack3);
        stack3.isHidden = true;
        stack3.setWidth(width: view.frame.width / 1);
        stack3.centerTo(element: view.centerXAnchor);
        stack3.padTop(from: border1.bottomAnchor, num: 10 );
        stack3.setHeight(height: 45)
        
        view.addSubview(stack1);
        stack1.isHidden = true;
        stack1.setWidth(width: view.frame.width / 1);
        stack1.centerTo(element: view.centerXAnchor);
        stack1.padTop(from: border1.bottomAnchor, num: 5 );
        stack1.setHeight(height: 45)
        
        view.addSubview(border2);
        border2.isHidden = true;
        border2.centerTo(element: view.centerXAnchor);
        border2.padTop(from: stack3.bottomAnchor, num: 5);
        
        view.addSubview(stack4);
        stack4.isHidden = true;
        stack4.setWidth(width: view.frame.width / 1);
        stack4.centerTo(element: view.centerXAnchor);
        stack4.padTop(from: border2.bottomAnchor, num: 10 );
        stack4.setHeight(height: 45)
        
        view.addSubview(border3);
        border3.isHidden = true;
        border3.centerTo(element: view.centerXAnchor);
        border3.padTop(from: stack4.bottomAnchor, num: 5);
        
        view.addSubview(stack5);
        stack5.isHidden = true;
        stack5.setWidth(width: view.frame.width / 1);
        stack5.centerTo(element: view.centerXAnchor);
        stack5.padTop(from: border3.bottomAnchor, num: 10 );
        stack5.setHeight(height: 45)
        
        view.addSubview(border4);
        border4.isHidden = true;
        border4.centerTo(element: view.centerXAnchor);
        border4.padTop(from: stack5.bottomAnchor, num: 5)
        
        view.addSubview(stack6);
        stack6.isHidden = true;
        stack6.setWidth(width: view.frame.width / 1);
        stack6.centerTo(element: view.centerXAnchor);
        stack6.padTop(from: border4.bottomAnchor, num: 10 );
        stack6.setHeight(height: 45)
        
        view.addSubview(border5);
        border5.isHidden = true;
        border5.centerTo(element: view.centerXAnchor);
        border5.padTop(from: stack6.bottomAnchor, num: 5);
        
        view.addSubview(error);
        error.padBottom(from: view.safeAreaLayoutGuide.bottomAnchor, num: 60);
        error.centerTo(element: view.centerXAnchor);
    }
    
    func setErrorText(text: String) {
        error.text = text;
    }
    
    func registerBusiness(completion: @escaping (Int) -> ()) {
        let adminSignupUrl = URL(string: JURL + "adminSignup");
        let dictToSend = [
        "firstName": firstName,
        "lastName": lastName,
        "typeOfBusiness": typeOfBusiness,
        "businessName": businessName,
        "address": street,
        "city": city,
        "state": state,
        "zip": zip,
        "phoneNumber": phone,
        "website": website,
        "bookingColumnType": thingBooked,
        "bookingColumnNumber": thingBookedNum,
        "email": email,
        "password": password,
        "sunOpen": sunOpen,
        "sunClose": sunClose,
        "satOpen": satOpen,
        "satClose":satClose,
        "monOpen": monOpen,
        "monClose": monClose,
        "tueOpen": tueOpen,
        "tueClose": tueClose,
        "wedOpen": wedOpen,
        "wedClose": wedClose,
        "thuOpen": thuOpen,
        "thuClose": thuClose,
        "friOpen": friOpen,
        "friClose": friClose]
        var request = URLRequest(url: adminSignupUrl!);
        request.httpMethod = "POST";
        request.addValue("application/json", forHTTPHeaderField: "Content-Type");
        
        
        if let dataToSend = try? JSONSerialization.data(withJSONObject: dictToSend, options: []) {
            URLSession.shared.uploadTask(with: request, from: dataToSend) { (data, response, error) in
                print("worked");
                if let httpResponse = response as? HTTPURLResponse {
                    completion(httpResponse.statusCode)
                    print(httpResponse)
                    if let data = data {
                    let token = try? JSONSerialization.jsonObject(with: data, options: [])
                        if let tokenToSave = token as? [String: Any] {
                            print(tokenToSave["token"]!)
                           
                        }
                    }
                }
            }.resume();
        }
    
    }
    
}

extension RegisterAdminControllerPtTwo: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}
