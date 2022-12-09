//
//  NotiDetailViewController.swift
//  Passing_Data
//
//  Created by MZ01-MINCKAN on 2022/12/08.
//

import UIKit

class NotiDetailViewController: UIViewController {
    
    let notificationName = Notification.Name("sendSomeString")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }

    @IBAction func NotiAction(_ sender: Any) {
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo:["str": "notification string"] )
        
        self.dismiss(animated: true)
    }
    

}
