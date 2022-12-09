//
//  DetailViewController.swift
//  Passing_Data
//
//  Created by MZ01-MINCKAN on 2022/12/08.
//

import UIKit

class DetailViewController: UIViewController {

    var something = ""
    @IBOutlet weak var someLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        someLabel.text = something
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
