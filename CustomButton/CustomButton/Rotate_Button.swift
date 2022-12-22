//
//  Rotate_Button.swift
//  CustomButton
//
//  Created by MZ01-MINCKAN on 2022/12/22.
//

import UIKit


enum RotateType {
    case up
    case down
}


class Rotate_Button: UIButton {
    
    init() {
        super.init(frame: .zero)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
       
    }
    
    private var isUp = RotateType.down {
        didSet {
            changeUI()
        }
    }
    
//    var selectTypeCallback: (RotateType) -> Void = { _ in  }
    var selectTypeCallback: ((RotateType) -> Void)?
    
    private func configure() {
        self.addTarget(self, action: #selector(selectButton), for: .touchUpInside)
    }
    
    @objc private func selectButton() {
        if isUp == .up {
            isUp = .down
        } else {
            isUp = .up
        }
        
        selectTypeCallback?(isUp)
    }

    private func changeUI() {
        UIView.animate(withDuration: 1) {
            if self.isUp == .up {
                self.imageView?.transform = CGAffineTransform(rotationAngle: .pi)
                self.backgroundColor = self.backgroundColor?.withAlphaComponent(0.3)
            } else {
                self.imageView?.transform = .identity
                self.backgroundColor = self.backgroundColor?.withAlphaComponent(1)
            }
        }
    }

}
