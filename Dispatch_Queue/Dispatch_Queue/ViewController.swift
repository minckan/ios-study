//
//  ViewController.swift
//  Dispatch_Queue
//
//  Created by MZ01-MINCKAN on 2022/12/12.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var finishLabel: UILabel!
    // dispatch queue
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {timer in
            self.timerLabel.text = Date().timeIntervalSince1970.description
        }
    }


    @IBAction func action1(_ sender: Any) {
        simpleClosure {
            self.finishLabel.text = "끝"
        }
    }


    func simpleClosure(completion: @escaping () -> Void) {
        
        DispatchQueue.global().async {// 화면이 멈추지 않게 하기위해서 다른 스레드를 추가한다. (작업자 추가)
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.1)
                // 메인스레드가 멈춘다. UI적 요소들이 다 멈춘다.
                print(index)
            }
            DispatchQueue.main.async {
                completion()
            }
            
        }
      
    }
    
    @IBAction func action2(_ sender: Any) {
        let dispatchGroup = DispatchGroup()
        
        // ❗️async로 했지만 하나의 작업자(스레드)에 넣게되면 동기로 작동한다.
        // ❗️여러개의 스레드에서 작업한다 -> 동시에 작업시작.
        
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        let queue3 = DispatchQueue(label: "q3")
        let queue4 = DispatchQueue(label: "q4")
        let queue5 = DispatchQueue(label: "q5")
        let queue6 = DispatchQueue(label: "q6")
        
//        queue1.async(group: dispatchGroup) {
//            for index in 0..<10 {
//                Thread.sleep(forTimeInterval: 0.2)
//                print(index)
//            }
//        }
//        queue2.async(group: dispatchGroup) {
//            for index in 10..<20 {
//                Thread.sleep(forTimeInterval: 0.2)
//                print(index)
//            }
//        }
//        queue3.async(group: dispatchGroup) {
//            for index in 20..<30 {
//                Thread.sleep(forTimeInterval: 0.2)
//                print(index)
//            }
//        }
//
        
        // ❗️qos: 절대적이지 않고 대체적으로 반영된다.
        queue4.async(group:dispatchGroup, qos: .background) {
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 0..<10 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
                dispatchGroup.leave()
            }
        }
        
        queue5.async(group:dispatchGroup, qos: .userInteractive) {
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 10..<20 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
                dispatchGroup.leave()
            }
        }
        
        queue6.async(group:dispatchGroup) {
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 20..<30 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
                dispatchGroup.leave()
            }
        }
    
        

        // ❗️
        dispatchGroup.notify(queue: DispatchQueue.main) {
            print("The End!")
        }
        
    }
    
    
    @IBAction func action3(_ sender: Any) {
        
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        
                queue1.sync {
                    for index in 0..<10 {
                        Thread.sleep(forTimeInterval: 0.2)
                        print(index)
                    }
                    
//                     deadlock -> 상대 작업이 끝날때 까지 서로 계속 기다리는 상태
//                    queue1.sync {
//                        for index in 10..<20 {
//                            Thread.sleep(forTimeInterval: 0.2)
//                            print(index)
//                        }
//                    }
                }

        
        // sync의 특징: 내 작업의 진행이 완료될때까지 다른 스레드는 아무것도 진행할수 없음.
        // 언제 sync를 사용?
        // 굉장히 중요한 작업이라서 이 작업이 반드시 완료 하고 다음로직으로 넘어가야 하는 경우에 sync로 걸어준다.
    }
}

