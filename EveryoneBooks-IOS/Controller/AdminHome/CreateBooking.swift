//
//  CreateBookingViewController.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 9/25/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class CreateBooking: UIViewController {
    
    var start: Int?;
    var close: Int? {
        didSet {
            var dataComing: [String] = [];
            while start! <= close! {
                dataComing.append(Utilities.itst[start!]!);
                start = start! + 1;
            }
            timePicker.data = dataComing;
        }
    }
    
    
    var services: [Service]? {
          didSet {
              print(self.services)
              servicesTable.data = self.services;
        }
    }

    private let datePickerText = Components().createNotAsLittleText(text: "Choose Date:");
    
  
    var employeesAvailable: [Employee]? {
        didSet {
            employeesTable.employees = self.employeesAvailable;
            employeesTable.dateChosen = self.dateChosen;
            employeesTable.timeChosen = self.timePicker.selectedItem;
            employeesTable.services = servicesTable.selectedServices;
            employeesTable.businessId = Utilities().decodeAdminToken()!["businessId"] as! String;
        }
    }
    
    private let servicesChosenTable: ServicesChosenTable = {
           let sct = ServicesChosenTable();
           sct.setWidth(width: UIScreen.main.bounds.width / 1.3);
           sct.setHeight(height: 150);
           sct.backgroundColor = .clear;
           return sct;
       }()
    
    private let employeesTable: EmployeesAvailableTable = {
           let eat = EmployeesAvailableTable();
           eat.backgroundColor = .literGray;
           return eat;
       }()
    
    private let costText: UITextView = {
           let uitv = Components().createLittleText(text: "");
           uitv.font = .boldSystemFont(ofSize: 16);
           uitv.backgroundColor = .mainLav;
           return uitv;
       }()
 
    
    private let datePicker: UIDatePicker = {
        let uidp = UIDatePicker();
        uidp.datePickerMode = .date;
        uidp.addTarget(self, action: #selector(dateChanged), for: .allEditingEvents);
        uidp.setWidth(width: fullWidth / 1.2);
        uidp.setHeight(height: 110);
        return uidp;
    }()
    
    private let dismissButton: UIButton = {
        let uib = Components().createXButton();
        uib.addTarget(self, action: #selector(dismissCreateBooking), for: .touchUpInside);
        return uib;
    }();
    
    private let popUp: UIView = {
           let uisv = UIScrollView();
           uisv.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.5)
           uisv.backgroundColor = .mainLav;
           return uisv;
    }()
    
    private let backDrop = Components().createBackDrop();
    
    private let timePickerText = Components().createNotAsLittleText(text: "Choose Time:");
    
    private let timePicker = GenericDropDown();
    
    private let servicesText = Components().createNotAsLittleText(text: "Choose Services:");
    
    private let servicesTable = ServicesTable();
    
    private let noServicesText = Components().createNotAsLittleText(text: "Please add services that can be booked in the Edit Business Menu.");
    
    private let timeDurationText: UITextView = {
        let uitv = Components().createLittleText(text: "");
        uitv.backgroundColor = .mainLav;
        uitv.font = .boldSystemFont(ofSize: 16);
        return uitv;
    }()
    
    private let continueButton: UIButton = {
        let uib = Components().createContinueBookingButton()
        uib.addTarget(self, action: #selector(continueHit), for: .touchUpInside);
        return uib;
    }();
    
    private let servicesChosenText: UITextView = {
         let uitv = Components().createLittleText(text: "Services Chosen: ");
         uitv.backgroundColor = .mainLav;
         uitv.font = .boldSystemFont(ofSize: 16);
         return uitv;
     }()
    
    lazy var employeesAvailableText: UITextView = {
           let uitv = Components().createSimpleText(text: "Employees Avaliable");
           uitv.backgroundColor = .mainLav;
           uitv.font = .boldSystemFont(ofSize: 16);
           return uitv;
       }()
    
    private let chooseServiceText: UITextView = {
        let uitv = Components().createLittleText(text: "Choose services to book:");
        return uitv;
    }()
    
    lazy var cancelButton: UIButton = {
            let cancelB = UIButton(type: .system);
            cancelB.addTarget(self, action: #selector(hideView), for: .touchUpInside);
            let title = NSAttributedString(string: "X", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)]);
            cancelB.setAttributedTitle(title, for: .normal);
            cancelB.tintColor = .black;
            cancelB.showsTouchWhenHighlighted = true;
            cancelB.setHeight(height: 32);
            cancelB.setWidth(width: 32);
            return cancelB;
       }()
       
       @objc func hideView() {
             UIView.animate(withDuration: 0.45) {
               self.popUp.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.6);
                 self.backDrop.alpha = 0;
             }
         }
         
 
    
      @objc func continueHit() {
          if servicesTable.selectedServices.count > 0 {
            getAvailableEmployees()
          }
          else {
              let noServicesSelected = UIAlertController(title: "No Services Selected", message: "Please select at least one service above that you would like performed.", preferredStyle: .alert);
              let okay = UIAlertAction(title: "Got it", style: .cancel, handler: nil);
              noServicesSelected.addAction(okay);
              DispatchQueue.main.async {
                  self.present(noServicesSelected, animated: true, completion: nil);
              }
          }
      }
    @objc func dismissCreateBooking() {
        self.dismiss(animated: true, completion: nil);
    }
    
    var dateChosen: String?;
    
    @objc func dateChanged() {
        getTimes(date: datePicker.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        configureView()
        getTimes(date: Date())
        getServices()
    }
    
    func configureView() {
        view.backgroundColor = .literGray;
        view.addSubview(datePickerText);
        datePickerText.setWidth(width: fullWidth / 1.3);
        datePickerText.padTop(from: view.safeAreaLayoutGuide.topAnchor, num: 15);
        datePickerText.centerTo(element: view.centerXAnchor);
        view.addSubview(datePicker);
        datePicker.padTop(from: datePickerText.bottomAnchor, num: 8);
        datePicker.centerTo(element: view.centerXAnchor);
        view.addSubview(dismissButton);
        dismissButton.padTop(from: view.topAnchor, num: 12);
        dismissButton.padRight(from: view.rightAnchor, num: 20);
        view.addSubview(timePickerText);
        timePickerText.setWidth(width: fullWidth / 1.3);
        timePickerText.padTop(from: datePicker.bottomAnchor, num: 15);
        timePickerText.centerTo(element: view.centerXAnchor);
        view.addSubview(timePicker);
        timePicker.setWidth(width: fullWidth / 1.3);
        timePicker.padTop(from: timePickerText.bottomAnchor, num: 0);
        timePicker.centerTo(element: view.centerXAnchor);
        view.addSubview(servicesText);
        servicesText.padTop(from: timePicker.bottomAnchor, num: 15);
        servicesText.setWidth(width: fullWidth / 1.3);
        servicesText.centerTo(element: view.centerXAnchor);
        view.addSubview(servicesTable);
        servicesTable.padTop(from: servicesText.bottomAnchor, num: 10);
        servicesTable.centerTo(element: view.centerXAnchor);
        servicesTable.setHeight(height: 130);
        servicesTable.setWidth(width: fullWidth);
        view.addSubview(continueButton);
        continueButton.padTop(from: servicesTable.bottomAnchor, num: 30);
        continueButton.centerTo(element: view.centerXAnchor);
       view.addSubview(backDrop);
        view.addSubview(popUp);
         backDrop.alpha = 0;
        popUp.addSubview(timeDurationText);
        timeDurationText.padTop(from: popUp.topAnchor, num: 6);
        timeDurationText.padLeft(from: popUp.leftAnchor, num: 20);
        popUp.addSubview(costText);
        costText.padTop(from: timeDurationText.bottomAnchor, num: 10);
        costText.padLeft(from: popUp.leftAnchor, num: 20);
        popUp.addSubview(servicesChosenText);
        servicesChosenText.padTop(from: costText.bottomAnchor, num: 6);
        servicesChosenText.padLeft(from: popUp.leftAnchor, num: 20);
        popUp.addSubview(servicesChosenTable);
        servicesChosenTable.padTop(from: servicesChosenText.bottomAnchor, num: 6);
        servicesChosenTable.centerTo(element: popUp.centerXAnchor);
        popUp.addSubview(employeesAvailableText);
        employeesAvailableText.padTop(from: servicesChosenTable.bottomAnchor, num: 2);
        employeesAvailableText.centerTo(element: popUp.centerXAnchor);
        popUp.addSubview(cancelButton);
        cancelButton.padRight(from: view.rightAnchor, num: 10)
        cancelButton.padTop(from: popUp.topAnchor, num: 15);
        popUp.addSubview(employeesTable)
        employeesTable.backgroundColor = .mainLav;
        employeesTable.padTop(from: employeesAvailableText.bottomAnchor, num: 6);
        employeesTable.centerTo(element: popUp.centerXAnchor);
        employeesTable.setHeight(height: UIScreen.main.bounds.height / 3);
        employeesTable.setWidth(width: UIScreen.main.bounds.width);
        view.addSubview(noServicesText);
        noServicesText.padTop(from: servicesText.bottomAnchor, num: 8);
        noServicesText.centerTo(element: popUp.centerXAnchor);
        noServicesText.isHidden = true;
    }
    
    func getAllTimes(start: Int, close: Int) {
           var newStart = start;
           var times: [String] = [];
           while newStart < close {
               times.append(Utilities.itst[newStart]!)
               newStart += 1;
           }
           timePicker.data = times;
       }
    
    func getTimes(date: Date) {
        let df = DateFormatter();
        df.dateFormat = "MMM dd, yyyy";
        dateChosen = df.string(from: date);
        API().post(url: myURL + "business/startEndTime", headerToSend: Utilities().getAdminToken(), dataToSend: ["date" : self.dateChosen]) { (res) in
            self.start = res["open"] as? Int;
            self.close = res["close"] as? Int;
        }
    }
    
    func getServices() {
        API().post(url: myURL + "services/getServices", dataToSend: ["businessId": Utilities().decodeAdminToken()!["businessId"]!]) { (res) in
            if let services = res["services"] as? [[String: Any]] {
                if services.count == 0 {
                    print("no services")
                    DispatchQueue.main.async {
                        self.servicesTable.isHidden = true;
                        self.noServicesText.isHidden = false;
                    }
                    return;
                }
            var newServicesArray: [Service] = [];
            for service in services {
                newServicesArray.append(Service(dic: service));
            }
            self.services = newServicesArray;
            }
        }
    }
    
    func getAvailableEmployees() {
           var serviceIds: [String] = [];
           var serviceNames: [String] = []
           var timeDurationNum = 0;
           var cost: Double = 0;
           for selectedService in servicesTable.selectedServices {
               serviceIds.append(selectedService.id);
               serviceNames.append(selectedService.serviceName);
               timeDurationNum = timeDurationNum + Utilities.timeDurationStringToInt[selectedService.timeDuration]!;
               cost = cost + selectedService.cost;
           }
           let costString = String(cost);
           let closeTime = Utilities.itst[Utilities.stit[timePicker.selectedItem!]! + timeDurationNum];
        API().post(url: myURL + "getBookings", dataToSend: ["businessId": Utilities().decodeAdminToken()!["businessId"], "date": dateChosen, "serviceIds": serviceIds, "timeChosen": timePicker.selectedItem]) { (res) in
               print(res)
               if res["statusCode"] as! Int == 409 {
                   let alert = UIAlertController(title: "Invalid Date", message: "The date or time you have chosen has already passed and cannot be scheduled.", preferredStyle: .alert);
                   let woops = UIAlertAction(title: "Woops, Got it!", style: .cancel, handler: nil);
                   alert.addAction(woops);
                   DispatchQueue.main.async {
                       self.present(alert, animated: true, completion: nil);
                   }
               }
               if let employees = res["employees"] as? [[String: String]] {
                   var newEmployeesArray: [Employee] = [];
                   for employee in employees {
                       let newEmployee = Employee(dic: employee)
                       newEmployeesArray.append(newEmployee);
                   }
                   print(newEmployeesArray);
                   print("DWDDQSDQSDFWDGFWJGKWGJWKDGJDWKGJWDKGJ")
                   self.employeesAvailable = newEmployeesArray;
                   self.servicesChosenTable.servicesChosen = serviceNames;
                   if newEmployeesArray.count > 0 {
                       print("GREAT!")
                       DispatchQueue.main.async {
                           self.timeDurationText.text = "From: " + self.timePicker.selectedItem! + "-" + closeTime!;
                           var costStringArray = costString.components(separatedBy: ".");
                           if costStringArray[1].count == 1 {
                               costStringArray[1] = costStringArray[1] + "0";
                               self.costText.text = "Cost: " + "$" + costStringArray[0] + "." +  costStringArray[1];
                           }
                           else {
                               self.costText.text = "Cost: " + "$" + costString;
                           }
                           UIView.animate(withDuration: 0.4) {
                               self.popUp.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - UIScreen.main.bounds.height / 1.15, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.15);
                               self.backDrop.alpha = 1;
                           }
                       }
                   }
               }
               else if res["statusCode"] as! Int == 406 {
                   // do the alert here
                   let alert = UIAlertController(title: "Time Unavailable", message: "Your business does not have any availability at this time. Want us to check for other nearby times on this date?", preferredStyle: .alert);
                   let searchOthers = UIAlertAction(title: "Yes", style: .default) { (action: UIAlertAction) in
                       print("gotta go find the others")
                   }
                   alert.addAction(searchOthers);
                   let noThanks = UIAlertAction(title: "Nope", style: .cancel) { (action: UIAlertAction) in
                       print("lol")
                   }
                   alert.addAction(noThanks)
                   DispatchQueue.main.async {
                       self.present(alert, animated: true, completion: nil);
                   }
               }
           }
       }
}
