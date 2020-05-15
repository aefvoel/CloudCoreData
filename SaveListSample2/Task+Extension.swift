//
//  Task+Extension.swift
//  SaveListSample2
//
//  Created by Toriq Wahid Syaefullah on 15/05/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    static func saveTask(context: NSManagedObjectContext, taskName: String) -> Task? {
        let task = Task(context: context)
        task.taskName = taskName
        
        do {
            try context.save()
            return task
        } catch {
            return nil
        }
    }
    
    static func fetchAll(context: NSManagedObjectContext) ->[Task]{
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            return []
        }
    }
    
    static func deleteAll(context: NSManagedObjectContext){
        let request: NSFetchRequest<NSFetchRequestResult> = Task.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
       try? context.execute(deleteRequest)

    }
    
    static func deleteSpecific(context: NSManagedObjectContext){
        let request: NSFetchRequest<NSFetchRequestResult> = Task.fetchRequest()
        let predicate = NSPredicate(format: "taskName BEGINS with 'v'")
        request.predicate = predicate
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
       try? context.execute(deleteRequest)

    }
}
