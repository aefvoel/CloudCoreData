//
//  ViewController.swift
//  SaveListSample2
//
//  Created by Jazilul Athoya on 14/05/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var taskTableView: UITableView!
    
    var taskList: [Task] = [] {
        didSet {
            taskTableView.reloadData()
        }
    }
    
    var helper: CoreDataHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Example using extension
//        taskList = Task.fetchAll(context: getViewContext())
        taskTableView.dataSource = self
        
        // Example using helper
        helper = CoreDataHelper(context: getViewContext())
        taskList = helper.fetchAll()
    }

    @IBAction func save(_ sender: Any) {
        if let newTask = Task.saveTask(context: getViewContext(), taskName: taskTextField.text ?? ""){
            
            taskTextField.text = ""
            taskList.append(newTask)
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        Task.deleteAll(context: getViewContext())
        taskList.removeAll()
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = taskList[indexPath.row].taskName
        return cell
    }
    
}
