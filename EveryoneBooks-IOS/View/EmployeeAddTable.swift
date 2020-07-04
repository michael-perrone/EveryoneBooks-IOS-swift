//
//  EmployeeAddTable.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 6/12/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class EmployeeAddTable: UIView {
   
    var url: String?;
    
    var employees: [[String:String]]?;
    
    var removing: [String] = [];
    
    private let success: UIView = {
        let uiv = Components().createSuccess(text: "Employee Successfully Deleted");
        return uiv;
    }();
    
    
    
    public let table: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: UITableView.Style.insetGrouped);
        return table;
    }();
    
    lazy var deleteButton: UIButton = {
        let uib = Components().createNormalButton(title: "Confirm Delete")
        uib.addTarget(self, action: #selector(deleteHit), for: .touchUpInside);
        return uib;
    }()
    
    @objc func deleteHit() {
        let data = ["employees": removing]
        API().post(url: url!, headerToSend: Utilities().getAdminToken(), dataToSend: data) { (res) in
            if let status = res["statusCode"] as? Int {
                if status == 200 {
                    DispatchQueue.main.async {
                       self.success.isHidden = false;
                       self.deleteButton.isHidden = true;
                    }
                }
            }
        }
    }
    
    
    required init() {
        super.init(frame: CGRect.zero);
        configureTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTable() {
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell");
        table.dataSource = self;
        table.setHeight(height: UIScreen.main.bounds.height / 3);
        table.setWidth(width: UIScreen.main.bounds.width);
        addSubview(table);
        table.centerTo(element: centerXAnchor);
        table.padTop(from: topAnchor, num: 0);
        table.backgroundColor = .clear;
        addSubview(deleteButton);
        deleteButton.setHeight(height: 45);
        deleteButton.setWidth(width: 200);
        deleteButton.centerTo(element: centerXAnchor);
        deleteButton.padBottom(from: bottomAnchor, num: 10);
        deleteButton.isHidden = true;
        
        addSubview(success);
        success.padTop(from: table.bottomAnchor, num: 10);
        success.centerTo(element: centerXAnchor);
        success.isHidden = true;
        
        
    }
}

extension EmployeeAddTable: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let employees = employees {
            if employees.count > 0 {
                return employees.count;
            }
            else {
                return 0;
            }
        }
            else {
                return 0;
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
        if let employees = employees {
            if employees.count > 0 {
                cell.textLabel?.text = employees[indexPath.row]["fullName"];
            }
        }
        return cell;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if let employeesIn = employees {
            if employeesIn.count > 0 {
                if editingStyle == .delete {
                    removing.append(employees![indexPath.row]["_id"]!)
                    employees!.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    deleteButton.isHidden = false;
                    success.isHidden = true;
                }
            }
        }
    }
}
