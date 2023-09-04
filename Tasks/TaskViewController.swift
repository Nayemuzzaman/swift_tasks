
//
//  TaskViewController.swift
//  Tasks
//
//  Created by Nayemuzzaman on 9/5/23.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var task: String?
    var currentPosition: Int? // Declare the property

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))

        // Do any additional setup after loading the view.
    }
    

   
    @objc func deleteTask() {
        // Ensure that currentPosition is defined and valid
        guard let currentPosition = currentPosition else {
            return
        }
        
        // Get the current count from UserDefaults
        var count = UserDefaults.standard.integer(forKey: "count")
        
        // Ensure count is greater than or equal to 0
        if count >= 0 {
            count -= 1
            UserDefaults.standard.set(count, forKey: "count")
            
            // Remove the task using the currentPosition
            UserDefaults.standard.setValue(nil, forKey: "task_\(currentPosition + 1)")
        }
        // Update the tasks list in the previous view controller
        if let presentingVC = navigationController?.viewControllers.first as? ViewController {
            presentingVC.updateTasks()
        }

        
        // Go back to the previous view controller (pop)
        navigationController?.popViewController(animated: true)
    }

    
}
