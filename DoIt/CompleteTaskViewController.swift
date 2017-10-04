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
    var task : Task? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task!.important {
            //Set Label for each cell
            taskLabel.text = "❗️\(task!.name!)"
        } else {
            //Set Label
            taskLabel.text = task!.name!
        }
        
    }

    @IBAction func completeButton(_ sender: Any) {
        
        //Used for Core Data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Delete Task from Core Data
        context.delete(task!)
        
        //After clicking the add button it will go back to the previous ViewController
        navigationController!.popViewController(animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
