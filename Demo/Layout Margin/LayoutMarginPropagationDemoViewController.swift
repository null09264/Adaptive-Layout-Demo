//
//  LayoutMarginPropagationDemoViewController.swift
//  Demo
//
//  Created by Wang Jinghan on 21/4/19.
//  Copyright © 2019 Sea Labs. All rights reserved.
//

import UIKit

class LayoutMarginPropagationDemoViewController: ViewController {

    @IBOutlet var child: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hidesBarsOnTap = true
    }
    
    @IBAction func updateChildPreservesSuperviewLayoutMargins(sender: UISwitch) {
        guard let child = child else { return }
        UIView.animate(withDuration: 0.3) {
            child.preservesSuperviewLayoutMargins = sender.isOn
            self.view.layoutIfNeeded()
        }
    }
}
