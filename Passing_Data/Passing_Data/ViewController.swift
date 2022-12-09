//
//  ViewController.swift
//  Passing_Data
//
//  Created by MZ01-MINCKAN on 2022/12/08.
//


// Passing Data
// 6가지
// 1. instance property: 직접적으로 해당 프로퍼티에 써서 전달
// 2. segue
// 3. instance : 나자신에 대한 접근을 할 수 있도록 하는 것.
// 4. delegate 패턴, delegation (대리, 위임)
// 5. closure
// 6. notification

import UIKit

class ViewController: UIViewController {
    
    var something = ""

    @IBOutlet weak var dataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationName = Notification.Name("sendSomeString")
    
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSomeString), name: notificationName, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(){
        print("will show")
    }
    
    @objc func showSomeString(notification: Notification) {
        if let str = notification.userInfo?["str"] as? String {
            self.dataLabel.text = str
        }
        
    }
    
    
    @IBAction func moveToNoti(_ sender: Any) {
        let detailVC = NotiDetailViewController(nibName:"NotiDetailViewController", bundle: nil)
        
    
        
        self.present(detailVC, animated: true)
    }
    
    // 2.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue로 연결된 액션이 실행될때 수행.
        if segue.identifier == "MySegueDetail" {
            if let detailVC = segue.destination as? SegueDetailViewController {
                detailVC.dataString = "abcd"
            }
        }
    }
    // 1.
    @IBAction func moveToDetail(_ sender: Any) {
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
//        detail.something = "텍스트!!"
       
        self.present(detail, animated: true)
        
        detail.someLabel.text = "라벨 테스트!"
    }
    
    // 3.
    @IBAction func moveToInstance(_ sender: Any) {
        let detailVC = InstanceDetailViewController(nibName:"InstanceDetailViewController", bundle: nil)
        
        detailVC.mainVC = self
        
        self.present(detailVC, animated: true)
    }
    @IBAction func moveTodelegate(_ sender: Any) {
        let detailVC = DelegateDetailViewController(nibName: "DelegateDetailViewController", bundle: nil)
        detailVC.delegate = self
        self.present(detailVC, animated: true)
    }
    
    
    @IBAction func moveToClosure(_ sender: Any) {
        let detailVC = ClosureDetailViewController(nibName: "ClosureDetailViewController", bundle: nil)
        
        detailVC.myClosure = {str in
            self.dataLabel.text = str
        }
        
        self.present(detailVC, animated: true)
    }
}


extension ViewController:DelegateDetailViewControllerDelegate {
    func passString(string: String) {
        self.dataLabel.text = string
    }
}
