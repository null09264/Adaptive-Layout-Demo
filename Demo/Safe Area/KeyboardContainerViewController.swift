//
//  KeyboardContainerViewController.swift
//  Demo
//
//  Created by Jinghan Wang on 20/4/19.
//  Copyright © 2019 Sea Labs. All rights reserved.
//

import UIKit

class KeyboardContainerViewController: UIViewController {
    
    private let contentViewControllerSegueID = "embed_segue"
    private var contentViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeForKeyboardChange()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == contentViewControllerSegueID {
            contentViewController = segue.destination
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: Handle Keyboard Events
extension KeyboardContainerViewController {
    private func observeForKeyboardChange() {
        let selector = #selector(handle(notification:))
        let names = [
            UIWindow.keyboardWillChangeFrameNotification,
            UIWindow.keyboardWillShowNotification,
            UIWindow.keyboardWillHideNotification
        ]
        
        for name in names {
            NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
        }
    }
    
    @objc private func handle(notification: Notification) {
        guard let param = NotificationService.keyboardParams(from: notification) else { return }
        guard let inner = contentViewController else { return }
        
        inner.additionalSafeAreaInsets.bottom = max(param.height - view.safeAreaInsets.bottom, 0)
        
        UIView.animate(
            withDuration: param.duration,
            delay: 0,
            options: [param.option, .beginFromCurrentState],
            animations: {
                inner.view.layoutIfNeeded()
            }, completion: nil
        )
    }
}
