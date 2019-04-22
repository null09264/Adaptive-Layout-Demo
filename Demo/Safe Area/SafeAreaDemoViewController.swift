//
//  SafeAreaDemoViewController.swift
//  Demo
//
//  Created by Jinghan Wang on 20/4/19.
//  Copyright © 2019 Sea Labs. All rights reserved.
//

import UIKit

class SafeAreaDemoViewController: ViewController {

    @IBOutlet var draggableView: SafeAreaMarkView?
    
    @IBInspectable var hasAdditionalSafeAreaInsets: Bool = false {
        didSet {
            if hasAdditionalSafeAreaInsets {
                additionalSafeAreaInsets = UIEdgeInsets(top: 100, left: 50, bottom: 200, right: 50)
            } else {
                additionalSafeAreaInsets = .zero
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hidesBarsOnTap = true
        
        if let view = draggableView {
            view.superview?.bringSubviewToFront(view)
        }
    }
    
    @IBAction func viewDidDrag(gesture: UIPanGestureRecognizer) {
        guard let square = draggableView else { return }
        
        switch gesture.state {
        case .changed:
            let translation = gesture.translation(in: view)
            let rect = view.safeAreaLayoutGuide.layoutFrame
            square.center = CGPoint(
                x: rect.midX + translation.x * 1.5,
                y: rect.midY + translation.y * 1.5
            )
        case .ended:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .beginFromCurrentState, animations: {
                let rect = self.view.safeAreaLayoutGuide.layoutFrame
                square.center = CGPoint(x: rect.midX, y: rect.midY)
            }, completion: nil)
        default: break
        }
    }
}
