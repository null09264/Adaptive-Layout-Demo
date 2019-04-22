//
//  SystemMinimumLayoutMarginDemoViewController.swift
//  Demo
//
//  Created by Wang Jinghan on 21/4/19.
//  Copyright © 2019 Sea Labs. All rights reserved.
//

import UIKit

class SystemMinimumLayoutMarginDemoViewController: ViewController {

    @IBOutlet var marginView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hidesBarsOnTap = true
        
        if let marginView = marginView {
            marginView.backgroundColor = marginView.tintColor.withAlphaComponent(0.2)
            marginView.layer.borderColor = marginView.tintColor.cgColor
        }
    }

    @IBAction func updateViewRespectsSystemMinimumLayoutMargins(sender: UISwitch) {
        UIView.animate(withDuration: 0.3) {
            self.viewRespectsSystemMinimumLayoutMargins = sender.isOn
            self.view.layoutIfNeeded()
        }
    }
}
