//
//  ColumnTableView.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 9/18/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

protocol GetBookingInfo: ColumnTableView {
    func getBookingInfo(time: String);
}

class ColumnTableView: UITableView, UITableViewDataSource, UITableViewDelegate, GetBookingInfo {
    
    func getBookingInfo(time: String) {
        API().post(url: myURL + "getBookings/individual", dataToSend: ["time": time, "bcn": self.bcn!, "businessId": Utilities().decodeAdminToken()!["businessId"], "date": self.date!]) { (res) in
            print(res)
        }
    }
    
    private var bookings: [Booking]? {
        didSet {
            for booking in self.bookings! {
                let times = booking.time?.components(separatedBy: "-");
                startTimes.append(times![0]);
                endTimes.append(times![1]);
                guard var startNum = Utilities.stit[times![0]] else {return}
                guard let endNum = Utilities.stit[times![1]] else {return}
                while startNum < endNum - 1 {
                    startNum = startNum + 1;
                    otherTimes.append(Utilities.itst[startNum]!)
                }
            }
        }
    }
    
    private var date: String?
    
    func setDate(date: String) {
        self.date = date;
    }
    
    var startTimes: [String] = [] {
        didSet {
          print(self.startTimes)
        }
    }
    
    var endTimes: [String] = [] {
        didSet {
            print(self.endTimes)
        }
    }
    
    var otherTimes: [String] = [];
    
    func setBookings(bookings: [Booking]) {
        self.bookings = bookings
    }
    
    private var timeSlotNum: Int? {
        didSet {
            reloadData()
        }
    }
    
    private var times: [String]?;
    
    private var bcn: String?;
    
    func setBcn(bcn: String) {
        self.bcn = bcn;
    }
    
    private var openTime: String?
    
    private var closeTime: String? {
        didSet {
            self.setTimes(open: openTime!, close: self.closeTime!);
        }
    }
    
    func setTimes(open: String, close: String) {
        var times: [String] = [];
        guard var startNum = Utilities.stit[open] else {return}
        guard let closeNum = Utilities.stit[close] else {return}
        while startNum < closeNum {
            guard let time = Utilities.itst[startNum] else {return}
            times.append(time);
            startNum = startNum + 1;
        }
        self.times = times;
    }
    
    func setOpenTime(open: String) {
        openTime = open;
    }
    
    func setCloseTime(close: String) {
        closeTime = close;
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: UITableView.Style.plain);
        separatorStyle = UITableViewCell.SeparatorStyle.none
        register(BookingCell.self, forCellReuseIdentifier: "2");
        register(BookedCell.self, forCellReuseIdentifier: "3");
        register(TopBookedCell.self, forCellReuseIdentifier: "4");
        register(BottomBookedCell.self, forCellReuseIdentifier: "5");
        dataSource = self;
        delegate = self;
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTimeSlotNum(num: Int) {
        self.timeSlotNum = num;
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let timeSlotNum = timeSlotNum {
            return timeSlotNum;
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let times = times {
            if let bookings = bookings {
                if bookings.count > 0 {
                    if startTimes.contains(times[indexPath.row]) {
                        let topBookedCell = dequeueReusableCell(withIdentifier: "4", for:  indexPath) as! TopBookedCell;
                        topBookedCell.setTime(time: times[indexPath.row]);
                        topBookedCell.configureCell();
                        topBookedCell.selectionStyle = .none;
                        topBookedCell.delegate = self;
                        return topBookedCell;
                    }
                    if indexPath.row + 2 <= times.count {
                        if endTimes.contains(times[indexPath.row + 1]) {
                            let bottomBookedCell = dequeueReusableCell(withIdentifier: "5", for:  indexPath) as! BottomBookedCell;
                            bottomBookedCell.setTime(time: Utilities.itst[Utilities.stit[times[indexPath.row + 1]]!]!);
                            bottomBookedCell.configureCell();
                            bottomBookedCell.selectionStyle = .none;
                            bottomBookedCell.delegate = self;
                            return bottomBookedCell;
                        }
                    }
                    if otherTimes.contains(times[indexPath.row]) {
                        let bookedCell = dequeueReusableCell(withIdentifier: "3", for:  indexPath) as! BookedCell;
                        bookedCell.configureThisCell();
                        bookedCell.setTime(time: times[indexPath.row]);
                        bookedCell.selectionStyle = .none;
                        bookedCell.delegate = self;
                        return bookedCell;
                    }
                }
            }
            let bookingCell = dequeueReusableCell(withIdentifier: "2", for: indexPath) as! BookingCell;
            bookingCell.setTime(time: times[indexPath.row]);
            bookingCell.configureCell();
            bookingCell.selectionStyle = .none;
            return bookingCell;
        }
        let bookingCell = dequeueReusableCell(withIdentifier: "2", for: indexPath) as! BookingCell;
        bookingCell.configureCell();
        bookingCell.selectionStyle = .none;
        return bookingCell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48;
    }
}
