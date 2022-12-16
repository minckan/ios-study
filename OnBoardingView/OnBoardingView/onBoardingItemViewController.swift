//
//  onBoardingItemViewController.swift
//  OnBoardingView
//
//  Created by MZ01-MINCKAN on 2022/12/15.
//

import UIKit

class onBoardingItemViewController: UIViewController {
    
    var mainText = ""
    var subText = ""
    var topImage = UIImage()

    @IBOutlet private weak var TopImageView: UIImageView!
    @IBOutlet private weak var mainTitleLabel: UILabel! {
        didSet {
            mainTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        }
    }
    @IBOutlet private weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTitleLabel.text = mainText
        descriptionLabel.text = subText
        TopImageView.image = topImage
        
    }




}
