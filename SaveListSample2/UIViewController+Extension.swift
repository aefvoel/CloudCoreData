//
//  UIViewController+Extension.swift
//  SaveListSample2
//
//  Created by Toriq Wahid Syaefullah on 15/05/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension UIViewController {
    func getViewContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
        
    }
}
