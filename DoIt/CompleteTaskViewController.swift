//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by C T on 10/3/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    
    
    @IBOutlet weak var taskLabel: UILabel!
    
    
    //New task object
    var task = Task()
    
    //Used to pass information between ViewControllers
    var previousViewController = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task.important {
            //Set Label for each cell
            taskLabel.text = "❗️\(task.name)"
        } else {
            //Set Label
            taskLabel.text = task.name
        }
        
    }

    @IBAction func completeButton(_ sender: Any) {
        
        //Remove the task after pushing the complete button
        previousViewController.tasks.remove(at: previousViewController.selectedIndex)
        
        //Refresh the tableView after adding a new task
        previousViewController.tableView.reloadData()
        
        //After clicking the add button it will go back to the previous ViewController
        navigationController!.popViewController(animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
