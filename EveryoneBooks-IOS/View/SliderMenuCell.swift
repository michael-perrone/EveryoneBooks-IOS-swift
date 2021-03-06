//
//  SliderMenuCell.swift
//  EveryoneBooks-IOS
//
//  Created by Michael Perrone on 10/2/20.
//  Copyright © 2020 Michael Perrone. All rights reserved.
//

import UIKit

class SliderMenuCell: UITableViewCell {

    var item: SelectionItem?;
    
    var delegate: SliderMenuDelegate?;
    
    private let imageV: UIImageView = {
        let uiv = UIImageView();
        return uiv;
    }()
    
    private let cellTitle: UITextView = {
        let uitv = Components().createSimpleText(text: "");
        return uitv;
    }()
    
    @objc func hit(_ sender: UITapGestureRecognizer? = nil) {
        if let item = item {
            delegate?.goToSelectedVC(vc: item.vc!)
        }
        else {
            print("didnt work")
        }
    }
    
    func configureCell() {
        setWidth(width: fullWidth / 1.6);
        if let item = item {
            imageV.image = item.image;
            cellTitle.text = item.title;
            contentView.addSubview(imageV);
            let tap = UITapGestureRecognizer(target: self, action: #selector(hit))
            addGestureRecognizer(tap);
        }
    }
}
