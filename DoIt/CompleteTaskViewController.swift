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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskLabel.text = task.name
    }

    @IBAction func completeButton(_ sender: Any) {
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
