//
//  QuizViewController.swift
//  Demo
//
//  Created by Wang Jinghan on 22/4/19.
//  Copyright © 2019 Sea Labs. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Quiz Set 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Quiz Set 2
    }
    
    override func viewSafeAreaInsetsDidChange() {
        print("A")
    }
    
    override func viewLayoutMarginsDidChange() {
        print("B")
    }
}

// MARK: Questions
extension QuizViewController {
    private func quiz0() {
        // Do Nothing
    }
    
    private func quiz1() {
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
    }
    
    private func quiz2() {
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
    }
    
    private func quiz3() {
        additionalSafeAreaInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}

// MARK: Answer
// quiz0: BAB,BAB
// quiz1: BBA,BABB
// quiz2: BBAB,BAB
// quiz3: BAB,BABBA
