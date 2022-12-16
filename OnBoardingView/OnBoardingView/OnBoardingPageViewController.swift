//
//  OnBoardingPageViewController.swift
//  OnBoardingView
//
//  Created by MZ01-MINCKAN on 2022/12/15.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController {
    
    
    var pages = [UIViewController]()
    var bottomButtonMargin :NSLayoutConstraint?
    var pageControl = UIPageControl()
    let startIndex = 0
    var currIdx = 0 {
        didSet {
            pageControl.currentPage = currIdx
        }
    }
    
    func makePageVC() {
        let itemVC1 = onBoardingItemViewController.init(nibName: "onBoardingItemViewController", bundle: nil)
        itemVC1.mainText = "1st page"
        itemVC1.topImage = UIImage(systemName: "arrowshape.turn.up.left.fill")!
        itemVC1.subText = "blah blah blah"
        
        let itemVC2 = onBoardingItemViewController.init(nibName: "onBoardingItemViewController", bundle: nil)
        itemVC2.mainText = "2nd page"
        itemVC2.topImage = UIImage(systemName: "ticket.fill")!
        itemVC2.subText = ""
        
        let itemVC3 = onBoardingItemViewController.init(nibName: "onBoardingItemViewController", bundle: nil)
        itemVC3.mainText = "3rd page"
        itemVC3.topImage = UIImage(systemName: "personalhotspot")!
        itemVC3.subText = ""
        
        pages.append(itemVC1)
        pages.append(itemVC2)
        pages.append(itemVC3)
        
        setViewControllers([itemVC1], direction: .forward, animated: true, completion: nil)
        
        self.dataSource = self
        self.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makePageVC()
        self.makeBottomButton()
        self.makePageControl()
        
    }
    
    func makeBottomButton() {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(dismissPageVC), for: .touchUpInside)
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false // 오토레이아웃 설정하기 위해 설정
        
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bottomButtonMargin = button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        bottomButtonMargin?.isActive = true
        
        hideButton()
        
        
        
    }
    
    func makePageControl() {
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = startIndex
        
        // pageControl.isUserInteractionEnabled = false // 컨트롤러 눌렀을때 네비게이팅 처리
        
    
        
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -80).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
    }
    
    @objc func dismissPageVC() {
        self.dismiss(animated: true)
    }
    
    @objc func pageControlTapped(sender:UIPageControl) {
        
        if sender.currentPage > currIdx {
            self.setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
        } else {
            self.setViewControllers([pages[sender.currentPage]], direction: .reverse, animated: true, completion: nil)
        }
        
        self.currIdx = sender.currentPage
        buttonPresentationStyle(currentIndex: self.currIdx)
       
    }

}

extension OnBoardingPageViewController: UIPageViewControllerDataSource {
    // 현재 페이지에서 이전페이지로 갈때 이전페이지는 뭐냐
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        currIdx = currentIndex
        
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
        
        
        
    }
    
    // 현재 페이지에서 다음페이지로 갈때 다음페이지는 뭐냐
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        currIdx = currentIndex
        
        if currentIndex == pages.count - 1 {
            return pages.first
        } else {
            return pages[currentIndex + 1]
        }
        
    }
    
    
}

extension OnBoardingPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        guard let currentVC = pageViewController.viewControllers?.first else {
            return
        }
        
        guard let currentIndex = pages.firstIndex(of: currentVC) else {
            return
        }
        
        currIdx = currentIndex
        
        buttonPresentationStyle(currentIndex: currentIndex)
        

    }
    
    func buttonPresentationStyle(currentIndex:Int) {
        if  currentIndex == pages.count - 1 {
            // show button
            self.showButton()
        } else {
            // hide button
            self.hideButton()
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [.curveEaseInOut], animations: {
            self.view.layoutIfNeeded()
        }, completion:nil)
    }
    
    func showButton()  {
        bottomButtonMargin?.constant = 0
    }
    
    func hideButton() {
        bottomButtonMargin?.constant = 100
    }
}
