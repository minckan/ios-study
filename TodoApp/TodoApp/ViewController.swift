//
//  ViewController.swift
//  TodoApp
//
//  Created by MZ01-MINCKAN on 2022/12/22.
//

import UIKit
import CoreData

enum PriorityLevel : Int64 {
    case level1
    case level2
    case level3
}

extension PriorityLevel {
    var color : UIColor {
        switch self {
        case .level1:
            return .green
        case .level2:
            return .orange
        case .level3:
            return .red
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var todoList = [TodoList]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Todo List"
        self.makeNavigationBar()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self

        fetchData()
        
        todoTableView.reloadData()

    }
    
    func fetchData() {
        let fetchRequest : NSFetchRequest<TodoList> = TodoList.fetchRequest()
        let context = appDelegate.persistentContainer.viewContext
    
        do {
            self.todoList = try context.fetch(fetchRequest)
            
        }catch {
            print(error)
        }
        
    }
    
    func makeNavigationBar() {
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
        item.tintColor = .black
        
        self.navigationItem.rightBarButtonItem = item
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        
        navigationBarAppearance.backgroundColor = .orange.withAlphaComponent(0.2)
               

        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance

        navigationController?.setNeedsStatusBarAppearanceUpdate()
    }
    
    
    @objc func addNewTodo() {
        let detailVC = TodoDetailViewController.init(nibName: "TodoDetailViewController", bundle: nil)
        detailVC.delegate = self
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        
        cell.topTitleLabel.text = todoList[indexPath.row].title
        
        if let hasData = todoList[indexPath.row].date {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd hh:mm:ss"
            let dateString = formatter.string(from: hasData)
            cell.dateLabel.text = dateString
        } else {
            cell.dateLabel.text = ""
        }
        
        let priority = todoList[indexPath.row].prioirtyLevel
        let priorityColor = PriorityLevel(rawValue: priority)?.color
        
        
        cell.priorityView.backgroundColor = priorityColor
        cell.priorityView.layer.cornerRadius = cell.priorityView.bounds.height / 2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = TodoDetailViewController.init(nibName: "TodoDetailViewController", bundle: nil)
        detailVC.delegate = self
        detailVC.selectedTodoList = todoList[indexPath.row]
        self.present(detailVC, animated: true, completion: nil)
    }
    
}

extension ViewController:TodoDetailViewControllerDelegate {
    func didFinishSaveData() {
        fetchData()
        self.todoTableView.reloadData()
    }
}

