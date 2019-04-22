//
//  ViewController.swift
//  Demo
//
//  Created by Jinghan Wang on 19/4/19.
//  Copyright © 2019 Sea Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if hidesBarsOnTap {
            navigationController?.hidesBarsOnTap = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    var hidesBarsOnTap = false

    @IBAction func dismissKeyboard() {
        view.endEditing(true)
    }
}

