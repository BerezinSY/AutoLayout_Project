//
//  RedSubview.swift
//  AutoLayout_Project
//
//  Created by Stanislav BEREZIN on 17.05.2024.
//

import UIKit

class RedSubview: UIView {
    
    @IBOutlet var height: NSLayoutConstraint!
    
    static func instanceFromNib() -> UIView? {
        Bundle.main.loadNibNamed("RedView", owner: nil)?.first as? RedSubview
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
    }
    
    // здесь мы не делаем обновление лайаута не сразу а просто фиксируем его изменения
    // в модели движка AutoLayout
    // в BlueSubview - аналогично.
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
