//
//  ViewController.swift
//  OnBoardingView
//
//  Created by MZ01-MINCKAN on 2022/12/15.
//

import UIKit

class ViewController: UIViewController {
    
    
    var didShowOnBoardingView = false

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {

        if didShowOnBoardingView == false {
            didShowOnBoardingView = true
            
            let pageVC = OnBoardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
            
            pageVC.modalPresentationStyle = .fullScreen
            self.present(pageVC, animated: true, completion: nil)
        }
        

    }


}

