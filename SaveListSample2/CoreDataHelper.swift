//
//  CoreDataHelper.swift
//  SaveListSample2
//
//  Created by Toriq Wahid Syaefullah on 15/05/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import Foundation
import CoreData

struct CoreDataHelper {
    var context: NSManagedObjectContext
    
    func fetchAll<T: NSManagedObject>() ->[T]{
        let request = T.fetchRequest()
        do {
            return try context.fetch(request) as? [T] ?? []
        } catch {
            return []
        }
    }
}
