//
//  ViewController.swift
//  Navigation_Bar_Design
//
//  Created by MZ01-MINCKAN on 2022/12/23.
//

import UIKit


//navigation controller
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNaviTitleImage()
        makeBackButton()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationBackgroundDesign()
    }
    
    func navigationBackgroundDesign() {

//        let navigationBarAppearance = UINavigationBarAppearance()
//        navigationBarAppearance.configureWithDefaultBackground()
//        
//        navigationBarAppearance.backgroundColor = .orange.withAlphaComponent(0.2)
//               
//
//        navigationItem.scrollEdgeAppearance = navigationBarAppearance
//        navigationItem.standardAppearance = navigationBarAppearance
//        navigationItem.compactAppearance = navigationBarAppearance
//
//        navigationController?.setNeedsStatusBarAppearanceUpdate()
        
        
        // status bar design
        self.navigationController?.navigationBar.backgroundColor = .blue
                
        self.statusBar?.backgroundColor = .blue
        
    }
    
    func makeBackButton() {
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(systemItem: .bookmarks)
//        self.navigationItem.backButtonTitle = "BACK"
//        let backImage = UIImage(systemName: "backward.fill")?.withRenderingMode(.alwaysOriginal)
        
        guard let backImage = UIImage(named: "1114.jpg")?.withRenderingMode(.alwaysOriginal) else {
            return
        }
        let newImage = resizeImg(image: backImage, newWidth: 40, newHeight: 40)
        self.navigationController?.navigationBar.backIndicatorImage = newImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = newImage
        self.navigationController?.navigationBar.tintColor = UIColor.brown

        self.navigationItem.backButtonTitle = ""

    }
    
    func resizeImg(image: UIImage, newWidth: CGFloat, newHeight: CGFloat) -> UIImage? {
        let newImageRect = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: newImageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        UIGraphicsEndImageContext()
        return newImage
    }

    func setNaviTitleImage() {
        let btn = UIButton()
        btn.widthAnchor.constraint(equalToConstant: 90)
        btn.setTitle("BrandName", for: .normal)
        btn.setTitleColor(.gray, for: .normal)
        
        btn.addTarget(self, action: #selector(naviAction), for: .touchUpInside)
        
        self.navigationItem.titleView = btn
    }
    
    @objc func naviAction() {
        print("go to main")
    }
}

