//
//  ViewController.swift
//  CustomButton
//
//  Created by MZ01-MINCKAN on 2022/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myCustomButton: Rotate_Button!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCustomButton.selectTypeCallback = { updownType in
            print(updownType)
        }
//        let myButton  = Rotate_Button()
//        self.view.addSubview(myButton)
//
//        myButton.translatesAutoresizingMaskIntoConstraints = false // auto layout 설정
//
//        // 위치
//        myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        // 크기
//        myButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        myButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
//
//        myButton.backgroundColor = UIColor.orange
//        myButton.setTitle("my custom button", for: .normal)
//        myButton.setImage(UIImage(systemName: "arrow.down.square"), for: .normal)
        
    }


}

