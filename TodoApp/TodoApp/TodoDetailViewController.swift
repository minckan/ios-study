//
//  TodoDetailViewController.swift
//  TodoApp
//
//  Created by MZ01-MINCKAN on 2022/12/22.
//

import UIKit
import CoreData


protocol TodoDetailViewControllerDelegate:AnyObject {
    func didFinishSaveData()
}


class TodoDetailViewController: UIViewController{
    
    weak var delegate: TodoDetailViewControllerDelegate?
    let appdelegete = (UIApplication.shared.delegate as! AppDelegate)
   

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var priority : PriorityLevel?
    
    var selectedTodoList : TodoList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let hasData = selectedTodoList {
            titleTextField.text = hasData.title
            priority = PriorityLevel(rawValue: hasData.prioirtyLevel)
            makePriorityButtonDesign()
            deleteButton.isHidden = false
            saveButton.setTitle( "Update", for: .normal)
        } else {
            deleteButton.isHidden = true
            saveButton.setTitle( "Save", for: .normal)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lowButton.layer.cornerRadius = lowButton.bounds.height / 2
        normalButton.layer.cornerRadius = normalButton.bounds.height / 2
        highButton.layer.cornerRadius = highButton.bounds.height / 2
        
        lowButton.tintColor = .black
        normalButton.tintColor = .black
        highButton.tintColor = .black
    }


    @IBAction func setPriority(_ sender: UIButton) {
        switch sender.tag {
            case 1:
            priority = .level1
                break
            
            case 2:
            priority = .level2
                break
            
            case 3:
            priority = .level3
                break

            default:
                break
        }
        
        makePriorityButtonDesign()
    }
    
    func makePriorityButtonDesign() {
        lowButton.backgroundColor = .clear
        normalButton.backgroundColor = .clear
        highButton.backgroundColor = .clear

        switch self.priority {
            case .level1:
                lowButton.backgroundColor = priority?.color
                    break
                
            case .level2:
                normalButton.backgroundColor = priority?.color
                    break
                
            case .level3:
                highButton.backgroundColor = priority?.color
                    break
            
            default:
                break
        }
    }
    
    
    @IBAction func saveTodo(_ sender: Any) {
        
        if selectedTodoList != nil {
            updateTodo()
        } else {
            saveTodo()
        }
        
        delegate?.didFinishSaveData()
        self.dismiss(animated: true)

    }
    
    func saveTodo() {
        let context = appdelegete.persistentContainer.viewContext
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "TodoList", in: context) else {return}
        guard let object = NSManagedObject(entity: entityDescription, insertInto: context) as? TodoList else {return}
        
        object.title = titleTextField.text
        object.date = Date()
        object.uuid = UUID()
        object.prioirtyLevel = priority?.rawValue ?? PriorityLevel.level1.rawValue
        
        appdelegete.saveContext()
        
    }
    
    func updateTodo() {
        let context = appdelegete.persistentContainer.viewContext
        guard let hasData = selectedTodoList else {
            return
        }
        
        let fetchRequest:NSFetchRequest<TodoList> = TodoList.fetchRequest()
        
        guard let hasUUID = hasData.uuid else {
            return
        }
        
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        
        do {
            let loadedData = try context.fetch(fetchRequest)
            
            loadedData.first?.title = titleTextField.text
            loadedData.first?.date = Date()
            loadedData.first?.prioirtyLevel = priority?.rawValue ?? PriorityLevel.level1.rawValue
            
            appdelegete.saveContext()
            
            
        }catch {
            print(error)
        }

    }
    
    
    @IBAction func deleteTodo(_ sender: UIButton) {
        let context = appdelegete.persistentContainer.viewContext
        guard let hasData = selectedTodoList else {
            return
        }
        
        let fetchRequest:NSFetchRequest<TodoList> = TodoList.fetchRequest()
        
        guard let hasUUID = hasData.uuid else {
            return
        }
        
        fetchRequest.predicate = NSPredicate(format: "uuid = %@", hasUUID as CVarArg)
        
        do {
            let loadedData = try context.fetch(fetchRequest)
            
            if let loadFirstData = loadedData.first {
                context.delete(loadFirstData)
                appdelegete.saveContext()
            }
            
        } catch {
            print(error)
        }
        
        delegate?.didFinishSaveData()
        self.dismiss(animated: true)
    }
}
