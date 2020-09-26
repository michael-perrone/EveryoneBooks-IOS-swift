//
//  EmployeeShiftsTable.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 9/3/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class EmployeeBookingsTable: UITableView, UITableViewDelegate, UITableViewDataSource {
  
    var bookings: [Booking]?;
    
    var bct: String?;
    
    private let cell1 = "12121212";
    
    override init(frame: CGRect, style: UITableView.Style) {
           super.init(frame:frame, style: UITableView.Style.grouped);
           register(EmployeeBookingsCell.self, forCellReuseIdentifier: cell1);
           dataSource = self;
           delegate = self;
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let bookings = bookings else {return 0};
        return bookings.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: cell1, for: indexPath) as! EmployeeBookingsCell;
        cell.booking = bookings![indexPath.row]
        cell.configureCell();
        cell.setHeight(height: 125);
        cell.setWidth(width: fullWidth);
        cell.bct = self.bct;
        return cell;
    }

}
