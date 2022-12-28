//
//  ViewController.swift
//  MyFirstApp
//
//  Created by MZ01-MINCKAN on 2022/12/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var comNumber = Int.random(in: 1...10)
//    var myNumber:Int = 1

    
    // 앱이 화면에 들어오면 가장 먼저 실행하는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "선택하세요."
        numberLabel.text = ""
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let numString = sender.currentTitle else {return}
        numberLabel.text = numString
        
//        guard let num = Int(numString) else {return}
//        myNumber = num
    }
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        guard let myNumberString = numberLabel.text else {return}
        guard let myNumber = Int(myNumberString) else {return}
        if comNumber > myNumber {
            mainLabel.text = "UP"
        } else if comNumber < myNumber {
            mainLabel.text = "DOWN"
        } else {
            mainLabel.text = "BINGO⭐️"
        }
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
        comNumber = Int.random(in: 1...10)
       
    }
}

