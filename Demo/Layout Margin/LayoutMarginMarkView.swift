//
//  LayoutMarginMarkView.swift
//  Demo
//
//  Created by Wang Jinghan on 21/4/19.
//  Copyright © 2019 Sea Labs. All rights reserved.
//

import UIKit

class LayoutMarginMarkView: UIView {

    private let layoutMarginView = UIView()
    
    @IBInspectable var layoutMarginOutlineColor: UIColor = UIColor.red {
        didSet {
            layoutMarginView.layer.borderColor = layoutMarginOutlineColor.cgColor
            layoutMarginView.backgroundColor = layoutMarginOutlineColor.withAlphaComponent(0.5)
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
                item: layoutMarginView,
                attribute: attribute,
                relatedBy: .equal,
                toItem: layoutMarginsGuide,
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
        layoutMarginView.translatesAutoresizingMaskIntoConstraints = false
        layoutMarginView.layer.borderColor = layoutMarginOutlineColor.cgColor
        layoutMarginView.layer.borderWidth = 2
        addSubview(layoutMarginView)
    }
}
