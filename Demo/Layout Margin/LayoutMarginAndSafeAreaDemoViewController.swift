//
//  LayoutMarginAndSafeAreaDemoViewController.swift
//  Demo
//
//  Created by Wang Jinghan on 21/4/19.
//  Copyright © 2019 Sea Labs. All rights reserved.
//

import UIKit

class LayoutMarginAndSafeAreaDemoViewController: ViewController {

    @IBOutlet var marginView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hidesBarsOnTap = true
        additionalSafeAreaInsets = UIEdgeInsets(top: 100, left: 32, bottom: 100, right: 32)
        
        if let marginView = marginView {
            marginView.backgroundColor = marginView.tintColor.withAlphaComponent(0.2)
            marginView.layer.borderColor = marginView.tintColor.cgColor
        }
    }
    
    @IBAction func updateViewInsetsLayoutMarginsFromSafeArea(sender: UISwitch) {
        UIView.animate(withDuration: 0.3) {
            self.view.insetsLayoutMarginsFromSafeArea = sender.isOn
            self.view.layoutIfNeeded()
        }
    }
}
