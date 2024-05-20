//
//  LifeCycleView.swift
//  AutoLayout_Project
//
//  Created by Stanislav BEREZIN on 18.05.2024.
//

import UIKit

class LifeCycleView: UIView {
    
    private let subview: UIView
    
    override init(frame: CGRect) {
        subview = UIView()
        super.init(frame: frame)
        print(#function)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        print(#function)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print(#function)
    }
}
