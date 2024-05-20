//
//  ViewController.swift
//  AutoLayout_Project
//
//  Created by Stanislav BEREZIN on 17.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redContainer: UIView!
    @IBOutlet var blueContainer: UIView!
    
    private let redSubview = RedSubview.instanceFromNib() ?? UIView()
    private let blueSubview = BlueSubview.instanceFromNib() ?? UIView()
    private var isChanged = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(String(describing: Self.self)) - \(#function)")
        print("")
        print("")
        redContainer.addSubview(redSubview)
        blueContainer.addSubview(blueSubview)
        
        redSubview.translatesAutoresizingMaskIntoConstraints = false
        blueSubview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            redSubview.topAnchor.constraint(equalTo: redContainer.topAnchor),
            redContainer.bottomAnchor.constraint(equalTo: redSubview.bottomAnchor),
            redSubview.leadingAnchor.constraint(equalTo: redContainer.leadingAnchor),
            redContainer.trailingAnchor.constraint(equalTo: redSubview.trailingAnchor),
            
            blueSubview.topAnchor.constraint(equalTo: blueContainer.topAnchor),
            blueContainer.bottomAnchor.constraint(equalTo: blueSubview.bottomAnchor),
            blueSubview.leadingAnchor.constraint(equalTo: blueContainer.leadingAnchor),
            blueContainer.trailingAnchor.constraint(equalTo: blueSubview.trailingAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(String(describing: Self.self)) - \(#function)")
        print("")
        print("")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("\(String(describing: Self.self)) - \(#function)")
        print("")
        print("")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("\(String(describing: Self.self)) - \(#function)")
        print("")
        print("")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\(String(describing: Self.self)) - \(#function)")
        print("")
        print("")
    }
    
    @IBAction func deactivateConstraintUsingSetNeedsUpdateConstraints(_ sender: UIButton) {
        (blueSubview as? BlueSubview)?.deactivateHeightUsingSetNeedsUpdateConstraints()
    }
    
    
    
    // 2 цикла обновления layout потом что в каждой subview запускается layoutIfNeeded()
    @IBAction func changeHeightLayoutIfNeeded(_ sender: UIButton) {
        let height: CGFloat = isChanged ? 100 : 50
        isChanged.toggle()
        (redSubview as? RedSubview)?.changeHeightUsingLayoutIfNeeded(height: height)
        (blueSubview as? BlueSubview)?.changeHeightUsingLayoutIfNeeded(height: height)
    }
    
    // 1 цикл обновления layout, потому что изменения просто фиксируются в каждой subview но
    // окончательное обновление происходит из родительской вьюшки
    @IBAction func changeHeightSetNeedsLayout(_ sender: UIButton) {
        let height: CGFloat = isChanged ? 100 : 50
        isChanged.toggle()
        (redSubview as? RedSubview)?.changeHeightUsingSetNeedsLayout(height: height)
        (blueSubview as? BlueSubview)?.changeHeightUsingSetNeedsLayout(height: height)
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
}

