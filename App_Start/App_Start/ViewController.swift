//
//  ViewController.swift
//  App_Start
//
//  Created by MZ01-MINCKAN on 2022/12/07.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var testButton: UIButton!
    @IBAction func doSomething(_ sender: Any) {
        print("button touched!")
        testButton.backgroundColor = .orange
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        testButton.backgroundColor = UIColor.blue
        
    }


}

