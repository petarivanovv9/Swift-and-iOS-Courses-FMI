//
//  ViewController.swift
//  28.10-swift-ios-lab3
//
//  Created by Petar Ivanov on 10/28/17.
//  Copyright © 2017 Petar Ivanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let customView = UIMyTabView(frame: CGRect(x: 50.0, y:50.0, width: 300.0, height: 300.0))
        
        self.view.addSubview(customView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

