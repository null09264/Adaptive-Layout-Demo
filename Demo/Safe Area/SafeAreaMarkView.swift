//
//  SafeAreaMarkView.swift
//  Demo
//
//  Created by Jinghan Wang on 20/4/19.
//  Copyright © 2019 Sea Labs. All rights reserved.
//

import UIKit

@IBDesignable class SafeAreaMarkView: UIView {
    private let safeAreaView = UIView()
    
    @IBInspectable var safeAreaOutlineColor: UIColor = UIColor.red {
        didSet {
            safeAreaView.layer.borderColor = safeAreaOutlineColor.cgColor
            safeAreaView.backgroundColor = safeAreaOutlineColor.withAlphaComponent(0.2)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureViews()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        let attributes: [NSLayoutConstraint.Attribute] = [
            .leading,
            .trailing,
            .top,
            .bottom
        ]
        
        let constraints = attributes.map { (attribute) -> NSLayoutConstraint in
            let constraint = NSLayoutConstraint(
                item: safeAreaView,
                attribute: attribute,
                relatedBy: .equal,
                toItem: safeAreaLayoutGuide,
                attribute: attribute,
                multiplier: 1,
                constant: 0
            )
            
            constraint.priority = .defaultHigh
            
            return constraint
        }
        
        addConstraints(constraints)
    }
    
    private func configureViews() {
        safeAreaView.translatesAutoresizingMaskIntoConstraints = false
        safeAreaView.layer.borderColor = safeAreaOutlineColor.cgColor
        safeAreaView.layer.borderWidth = 2
        addSubview(safeAreaView)
    }
}
