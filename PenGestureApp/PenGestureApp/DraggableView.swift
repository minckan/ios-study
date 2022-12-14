//
//  DraggableView.swift
//  PenGestureApp
//
//  Created by MZ01-MINCKAN on 2022/12/14.
//

import UIKit


class DraggableView:UIView {
    
    var dragType = DragType.none
    
    init() {
        super.init(frame: CGRect.zero)
        
        let pen = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        self.addGestureRecognizer(pen)
    }
    
    
    // 코드로 생성한게 아니고 인터페이스 빌더를 통해 셋팅한 요소들이 생성되면 (메모리에 올라가면) 아래 로직을 타게됨.
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let pen = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        self.addGestureRecognizer(pen)
        
//        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dragging(pen: UIPanGestureRecognizer) {
        switch pen.state {
        case .began:
            print("began")
        case .changed:
            
            let delta = pen.translation(in: self.superview) // 부모뷰를 기준으로 펜을 움직인 거리
            // 절대좌표
            var myPosition = self.center
            
            if dragType == .x {
                myPosition.x += delta.x
            } else if dragType == .y {
                myPosition.y += delta.y
            } else {
                myPosition.x += delta.x
                myPosition.y += delta.y
            }
            
            self.center = myPosition
            
            pen.setTranslation(CGPoint.zero, in: self.superview) // 움직인 거리 초기화
            
        case .ended, .cancelled:
            print("cancelled")
            
            if self.frame.minX < 0 {
                self.frame.origin.x = 0
            }
            
            if let hasSuperView = self.superview {
                if self.frame.maxX > hasSuperView.frame.maxX {
                    self.frame.origin.x = hasSuperView.frame.maxX - self.bounds.width
               }
            }
        default:
            break
        
        }
    }
    
    
}
