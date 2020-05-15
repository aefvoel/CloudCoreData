//
//  AppDelegate.swift
//  SaveListSample2
//
//  Created by Jazilul Athoya on 14/05/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import UIKit
import CoreData
import CloudKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    //Local
//    lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "TaskModel")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError?{
//                //Error Condition
//            }
//        })
//        return container
//    }()
    
    //CloudKit
    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        let container = NSPersistentCloudKitContainer(name: "TaskModel")
        
        // Create a store description for a local store
//        let localStoreLocation = URL(fileURLWithPath: "/path/to/local.store")
//        let localStoreDescription =
//            NSPersistentStoreDescription(url: localStoreLocation)
//        localStoreDescription.configuration = "Local"
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docDir = dirPath[0]
        let stringPath = docDir.appending("/cloud.store")
        // Create a store description for a CloudKit-backed local store
//        let cloudStoreLocation = URL(fileURLWithPath: "/Users/toriqwahidsyaefullah/Documents/cloud.store")
        let cloudStoreLocation = URL(fileURLWithPath: stringPath)
        let cloudStoreDescription =
            NSPersistentStoreDescription(url: cloudStoreLocation)
        cloudStoreDescription.configuration = "Cloud"

        // Set the container options on the cloud store
        cloudStoreDescription.cloudKitContainerOptions =
            NSPersistentCloudKitContainerOptions(
                containerIdentifier: "xyz.toriqwahid.CloudCoreData")
        
        // Update the container's list of store descriptions
        container.persistentStoreDescriptions = [
            cloudStoreDescription
        ]
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError?{
                //Error Condition
            }
        })
        return container
    }()
    
}

