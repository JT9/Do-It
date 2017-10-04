//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by C T on 10/3/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!

    @IBOutlet weak var importantSwitch: UISwitch!
    
    //Used to pass information between ViewControllers
    var previousViewController = TasksViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
    @IBAction func addTapped(_ sender: Any) {
        //Create a Task from the outlet information
        
        //Create a new task obj
        let task = Task()
        //Pass entered text into task
        task.name = taskNameTextField.text!
        
        //Used to see if the switch is on
        task.important = importantSwitch.isOn
        
        
        //Add a new task to the arrary in the previous ViewController
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
