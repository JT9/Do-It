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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    //Create a Task from the button press
    @IBAction func addTapped(_ sender: Any) {
        
        //Used for CoreData
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        
        //Create a new task with Core Data
        let task = Task(context: context)
        
        //Pass entered text into task
        task.name = taskNameTextField.text!
        
        //Used to see if the switch is on
        task.important = importantSwitch.isOn
        
        //Save CoreData
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //After clicking the add button it will go back to the previous ViewController
        navigationController!.popViewController(animated: true)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
