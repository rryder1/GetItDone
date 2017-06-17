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
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        
        //Function to sort data by its rank and reorder the rank, Should probably be moved into a class
        tasksArray.sort(by: {$0.rank < $1.rank})
        for i in 0 ..< tasksArray.count{
            tasksArray[i].rank = Int32(i)
        }
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasksArray.count
        
    }
    
    func getTasks() {
        
        let contextname = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            tasksArray = try contextname.fetch(Task.fetchRequest()) as! [Task]
        } catch {
            print("ERROR")
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Click")
        performSegue(withIdentifier: "taskSegue", sender: tasksArray[indexPath.row])
    }
    
    @IBAction func addButton(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasksArray[indexPath.row]
        
        if task.isImportant {
            cell.textLabel?.text = "❗️\(task.taskString!)"
        } else {
            cell.textLabel?.text = task.taskString!
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "taskSegue"{
            let nextVC = segue.destination as! TaskViewController
            
            nextVC.task = sender as? Task
            
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

