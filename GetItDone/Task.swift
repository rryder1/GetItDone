//
//  Task.swift
//  GetItDone
//
//  Created by Robert Ryder on 6/10/17.
//  Copyright © 2017 Robert Ryder. All rights reserved.
//

class Task {

    // Class for holding Task Information
    
    var taskString = ""
    var isImportant = false
    var dateDue = 0000
    
    init() {
        
    }
    
    init(task: String, important: Bool, date: Int) {
        
        taskString = task
        isImportant = important
        dateDue = date
        
    }

}
