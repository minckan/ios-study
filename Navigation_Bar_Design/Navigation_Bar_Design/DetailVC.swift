//
//  DetailVC.swift
//  Navigation_Bar_Design
//
//  Created by MZ01-MINCKAN on 2022/12/23.
//

import UIKit

class DetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.statusBar?.backgroundColor = .orange
        self.navigationController?.navigationBar.backgroundColor = .orange
    }
}

