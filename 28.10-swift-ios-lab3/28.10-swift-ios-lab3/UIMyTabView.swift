//
//  UIMyTabView.swift
//  28.10-swift-ios-lab3
//
//  Created by Petar Ivanov on 10/28/17.
//  Copyright © 2017 Petar Ivanov. All rights reserved.
//

import Foundation

import UIKit


class UIMyTabView : UIView {
    
    var segmentedControl: UISegmentedControl!
    
    let screenSize: CGRect = UIScreen.main.bounds

    override init(frame: CGRect) {
        super.init(frame: frame)
        let items = ["Blue", "Green", "Red"]
        segmentedControl = UISegmentedControl(items: items)
        // segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(changeColor(sender:)), for: .valueChanged)
    
        self.addSubview(segmentedControl)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func changeColor(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.backgroundColor = UIColor.blue
        case 1:
            self.backgroundColor = UIColor.green
        case 2:
            self.backgroundColor = UIColor.red
        default:
            self.backgroundColor = UIColor.black
        }
    }

}

