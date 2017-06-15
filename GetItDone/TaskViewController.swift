//
//  TaskViewController.swift
//  GetItDone
//
//  Created by Robert Ryder on 6/15/17.
//  Copyright © 2017 Robert Ryder. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {
    @IBOutlet weak var taskName: UILabel!
    
    var task: Task? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task!.isImportant {
            taskName.text = "❗️\(task!.taskString!)"
        } else {
            taskName.text = task!.taskString!
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButton(_ sender: AnyObject) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }

  }
