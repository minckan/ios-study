//
//  MovieCell.swift
//  MovieApp
//
//  Created by 강민주 on 2022/12/18.
//

import UIKit


class MovieCell:UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        }
    }
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        }
    }
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel! {
        didSet {
            priceLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        }
    }
}
