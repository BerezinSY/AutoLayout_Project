//
//  BlueSubview.swift
//  AutoLayout_Project
//
//  Created by Stanislav BEREZIN on 17.05.2024.
//

import UIKit

class BlueSubview: UIView {
    
    @IBOutlet var height: NSLayoutConstraint!
    
    static func instanceFromNib() -> UIView? {
        Bundle.main.loadNibNamed("BlueView", owner: nil)?.first as? BlueSubview
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("\(String(describing: Self.self)) - \(#function)")
        print("")
        print("")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        print("\(String(describing: Self.self)) - \(#function)")
        print("")
        print("")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.height.constant = 100
        }
    }
    
    func deactivateHeightUsingSetNeedsUpdateConstraints() {
        height.constant = 10
        setNeedsUpdateConstraints()
    }
    
    
    // здесь мы не делаем обновление лайаута не сразу а просто фиксируем его изменения
    // в модели движка AutoLayout
    // в RedSubview - аналогично.
    // можно конечно цикл обновления запустить и там и там и все будет работать
    // но это очень затратно по ресурсам
    // вместо этого можно изменить параметры и потом за один цикл применить эти изменения
    func changeHeightUsingSetNeedsLayout(height: CGFloat) {
        self.height.constant = height
        setNeedsLayout()
    }
    
    func changeHeightUsingLayoutIfNeeded(height: CGFloat) {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.height.constant = height
            self?.layoutIfNeeded()
        }
    }
}
