//
//  ClosureDetailViewController.swift
//  Passing_Data
//
//  Created by MZ01-MINCKAN on 2022/12/08.
//

import UIKit

class ClosureDetailViewController: UIViewController {
    
    var myClosure : ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func closurePassData(_ sender: Any) {
        myClosure?("closure data !!")
        self.dismiss(animated: true)
    }
}
