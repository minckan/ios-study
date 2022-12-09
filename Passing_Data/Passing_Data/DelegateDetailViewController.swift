//
//  DelegateDetailViewController.swift
//  Passing_Data
//
//  Created by MZ01-MINCKAN on 2022/12/08.
//

import UIKit

protocol DelegateDetailViewControllerDelegate: AnyObject {
    func passString(string: String)
}

class DelegateDetailViewController: UIViewController {
    
    weak var delegate :DelegateDetailViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func passDataToMainVC(_ sender: Any) {
        delegate?.passString(string: "delegate passData!!")
        self.dismiss(animated: true)
    }
    
}
