//
//  ViewController.swift
//  Setting_Clone_App
//
//  Created by MZ01-MINCKAN on 2022/12/12.
//

import UIKit

class ViewController: UIViewController{

    
    var settingModel = [[SettingModel]]()
    func makeData() {
        settingModel.append([SettingModel(leftImageName: "person.circle", menuTitle: "Sign in to your iPhone", subTitle: "Set up iCloud, the App Store and more.", rightImageName: nil)])
        
        settingModel.append([SettingModel(leftImageName: "gear", menuTitle: "General", subTitle: nil, rightImageName: "chevron.right"),
                             SettingModel(leftImageName: "person.fill", menuTitle: "Accessibility", subTitle: nil, rightImageName: "chevron.right"),
                             SettingModel(leftImageName: "hand.raised.fill", menuTitle: "Privacy", subTitle: nil, rightImageName: "chevron.right")])
        
//        SettingModel(leftImageName: <#T##String#>, menuTitle: <#T##String#>, subTitle: <#T##String?#>, rightImageName: <#T##String?#>)
        
    }
    
    
    
    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = UIColor(white: 245/255, alpha: 1)
        
        // 테이블 셀 등록.

        settingTableView.register( UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        
        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        
        title = "Settings"
       
        self.view.backgroundColor = UIColor(white: 245/255, alpha: 1)
        
        makeData()
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // 셀이 몇개가 나타나게 되는지 결정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    //    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 && indexPath.row == 0 {
           let myIdVC = MyIDViewController(nibName: "MyIDViewController", bundle: nil)
            
            self.present(myIdVC, animated: true, completion: nil)
        }
        
        else if indexPath.section == 1 && indexPath.row == 0 {
            let generalVC = UIStoryboard(name: "GeneralViewController", bundle: nil).instantiateViewController(withIdentifier: "GeneralViewController") as! GeneralViewController
            
            self.navigationController?.pushViewController(generalVC, animated: true)
        }
        

    }
    // 어떤 셀을 보여주게 할건지 결정.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            //dequeueReusableCell : 셀을 사용하는데 재사용하는데 사용하겠다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)as! ProfileCell
            
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            cell.profileImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            cell.bottomDescription.text = settingModel[indexPath.section][indexPath.row].subTitle
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.leftImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
        cell.leftImageView.tintColor = .red
        cell.middleTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
        cell.rightImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageName!)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        }
        return 60
    }
}

