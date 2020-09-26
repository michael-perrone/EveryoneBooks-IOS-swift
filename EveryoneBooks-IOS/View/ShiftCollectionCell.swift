//
//  ShiftCollectionCellCollectionViewCell.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 7/5/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class ShiftCollectionCell: UICollectionViewCell {
    
    
    weak var delegate: ShiftCellDelegate?
    
    var shiftId: String?;
    
    var index: Int?;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        configureCell();
    }
    
    required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    lazy var employeeName: UITextView = {
        let uitv = Components().createSimpleText(text: "");
        uitv.backgroundColor = .mainLav;
        uitv.font = .boldSystemFont(ofSize: 14);
        return uitv;
    }()
    
    lazy var shift: UITextView = {
        let uitv = Components().createSimpleText(text: "");
        uitv.backgroundColor = .mainLav;
        uitv.font = .boldSystemFont(ofSize: 14);
        return uitv;
    }()
    
    lazy var cancelButton: UIButton = {
        let uib = UIButton(type: .system);
        uib.setBackgroundImage(UIImage(named: "trash"), for: .normal);
        uib.addTarget(self, action: #selector(removeShift), for: .touchUpInside);
        uib.showsTouchWhenHighlighted = true;
        return uib;
    }();
    
    @objc func removeShift() {
        delegate?.deleteShift(shiftId: self.shiftId!, index: self.index!);
    }

    
    func configureCell() {
        addSubview(employeeName);
        employeeName.padLeft(from: leftAnchor, num: 4);
        employeeName.padTop(from: topAnchor, num: 5);
        employeeName.setWidth(width: UIScreen.main.bounds.width / 2.4);
        addSubview(shift);
        shift.padTop(from: topAnchor, num: 5);
        shift.padLeft(from: employeeName.rightAnchor, num: 20);
        addSubview(cancelButton)
        cancelButton.padTop(from: topAnchor, num: 5);
        cancelButton.setHeight(height: 25);
        cancelButton.setWidth(width: 25);
        setHeight(height: 10);
    }
    
    override func prepareForReuse() {
           super.prepareForReuse()

        self.employeeName.text = nil;
        self.shift.text = nil;
       }
}
