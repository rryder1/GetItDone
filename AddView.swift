//
//  AddView.swift
//  GetItDone
//
//  Created by Robert Ryder on 6/10/17.
//  Copyright © 2017 Robert Ryder. All rights reserved.
//

import UIKit

class AddView: UIViewController {
    
    let newTask = Task(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    
    var tasksArray: [Task] = []
  
    @IBOutlet weak var taskText: UITextField!

    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBAction func addButton(_ sender: AnyObject) {
        
        getTasks()
        
        newTask.taskString = taskText.text!
        newTask.isImportant = importantSwitch.isOn
        
        if importantSwitch.isOn {
            newTask.rank = Int32(-2)
        } else {
        newTask.rank = Int32(tasksArray.count + 1)
        }
    
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getTasks() {
        
        let contextname = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            tasksArray = try contextname.fetch(Task.fetchRequest()) as! [Task]
        } catch {
            print("ERROR")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
