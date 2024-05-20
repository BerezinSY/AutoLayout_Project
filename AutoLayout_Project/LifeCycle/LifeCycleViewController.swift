//
//  LifeCycleViewController.swift
//  AutoLayout_Project
//
//  Created by Stanislav BEREZIN on 18.05.2024.
//

import UIKit

class LifeCycleViewController: UIViewController {
    
    override func loadView() {
        view = LifeCycleView()
        print(#function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
    }
    
    override func loadViewIfNeeded() {
        super.loadViewIfNeeded()
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
}
