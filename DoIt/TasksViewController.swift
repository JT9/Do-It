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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Needs these two for Tableview to look to this class
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    //Gets called everytime your View Controller shows up on the screen
    override func viewWillAppear(_ animated: Bool) {
        
        //Used to get the tasks
        getTasks()
        
        //Reload tableView data
        tableView.reloadData()
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
            cell.textLabel?.text = "❗️\(task.name!)"
        } else {
            //Set Label for each cell
            cell.textLabel?.text = task.name!
        }
        
        return cell
    }
    
    //Used to perform segue to a selected cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTasksSegue", sender: task)
    }
    
    
    @IBAction func plusTapped(_ sender: Any) {
        //Used to move to another ViewController from pushing the plus button in the Nav Bar
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    
    func getTasks() {
        //Used for CoreData
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        } catch {
            print("Error")
        }
        
    }
    
    //Used to reference var previousViewController to pass information
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectTasksSegue" {
            
            let nextViewController = segue.destination as! CompleteTaskViewController
            
            nextViewController.task = sender as? Task
        }
    }
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            
        }
        
        
}

