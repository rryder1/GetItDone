//
//  ViewController.swift
//  GetItDone
//
//  Created by Robert Ryder on 6/10/17.
//  Copyright © 2017 Robert Ryder. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasksArray: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tasksArray = makeTasks()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasksArray.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Click")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasksArray[indexPath.row]
        
        if task.isImportant {
            cell.textLabel?.text = "❗️\(task.taskString)"
        } else {
            cell.textLabel?.text = task.taskString
        }
        
        return cell
    }
    
    func makeTasks() -> [Task]{
        
        var firstTask : [Task] = []
        
        let task1 = Task()
        task1.taskString = "Walk Dog"
        task1.dateDue = 10
        task1.isImportant = false
        
        let task2 = Task()
        task2.taskString = "Do Homework"
        task2.dateDue = 15
        task2.isImportant = true
        
        let task3 = Task()
        task3.taskString = "Run"
        task3.dateDue = 1
        task3.isImportant = false
        
        firstTask.append(task1)
        firstTask.append(task2)
        firstTask.append(task3)
        
        
        return firstTask
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

