//
//  ShiftsCollectionView.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 7/5/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

protocol ShiftCellDelegate: ShiftsCollectionView {
    func deleteShift(shiftId:String, index: Int)
}

class ShiftsCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ShiftCellDelegate {
    
    
    func deleteShift(shiftId: String, index: Int) {
       print(index)
    }
    
    
    var shifts: [Shift]? {
        didSet {
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
    

   
    init() {
        super.init(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        dataSource = self;
        delegate = self;
        register(ShiftCollectionCell.self, forCellWithReuseIdentifier: "cell")
        backgroundColor = .mainLav;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let shifts = self.shifts {
            return shifts.count;
        }
        else {
            print("wah")
            return 0;
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         var cell = dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ShiftCollectionCell;
        cell.setWidth(width: UIScreen.main.bounds.width)
        var name = shifts![indexPath.row].employeeName;
        if name.count > 19 {
            name = name[0..<17]
            name+="...";
        }
        cell.employeeName.text = name;
        cell.shift.text = shifts![indexPath.row].timeStart + "-" + shifts![indexPath.row].timeEnd;
        cell.shiftId = shifts![indexPath.row].id;
        cell.index = indexPath.row;
        cell.delegate = self;
        cell.cancelButton.padRight(from: cell.rightAnchor, num: UIScreen.main.bounds.width / 20);
        
        return cell;
    }
           func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: UIScreen.main.bounds.width, height: 30);
        }
    
}



