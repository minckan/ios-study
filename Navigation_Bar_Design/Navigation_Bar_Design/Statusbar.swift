//
//  Statusbar.swift
//  Navigation_Bar_Design
//
//  Created by MZ01-MINCKAN on 2022/12/23.
//

import UIKit

extension UIViewController {
    var statusBar:UIView? {
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        
        if let hasStatusBar = sceneDelegate?.statusBarView {
            window?.addSubview(hasStatusBar)
        }
        return sceneDelegate?.statusBarView
    }
}
