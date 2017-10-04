//
//  TasksViewController.swift
//  DoIt
//
//  Created by C T on 10/3/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

//Need to add UITableViewDelegate & DataSource in order to use TableView
class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    //Empty array of Task objects
    var tasks : [Task] = []
    
    //Used to keep track of index
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Using func to make tasks from Task class
        tasks = makeTasks()
        
        //Needs these two for Tableview to look to this class
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //How many rows from array
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //New UITableView object
        let cell = UITableViewCell()
        
        //Getting number of tasks to display
        let task = tasks[indexPath.row]
        
        if task.important {
            //Set Label for each cell
            cell.textLabel?.text = "❗️\(task.name)"
        } else {
            //Set Label for each cell
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    //Used to perform segue to a selected cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Update the index of the selected row
        selectedIndex = indexPath.row
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTasksSegue", sender: task)
    }
    
    
    
    
    //Used to make task objects
    func makeTasks() -> [Task] {
        
        //Used to test the tableView with object data
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Buy Cheese"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Mow the lawn"
        task3.important = false
        
        //returning 3 tester tasks
        return [task1, task2, task3]
        
        
        
    }
    @IBAction func plusTapped(_ sender: Any) {
        //Used to move to another ViewController from pushing the plus button in the Nav Bar
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    //Used to reference var previousViewController to pass information
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Used to check which segue to perform
        if segue.identifier == "addSegue" {
            
            let nextViewController = segue.destination as! CreateTaskViewController
            
            nextViewController.previousViewController = self
        }
        
        if segue.identifier == "selectTasksSegue" {
            
            let nextViewController = segue.destination as! CompleteTaskViewController
            
            nextViewController.task = sender as! Task
            nextViewController.previousViewController = self
        }
    }
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            
        }
        
        
}

