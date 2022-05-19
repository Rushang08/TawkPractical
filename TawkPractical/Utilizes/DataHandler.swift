//
//  DataHandler.swift
//  SelfTest
//
//  Created by Rushang Prajapati on 20/04/22.
//
//

import UIKit
import CoreData

class DataHandler: NSObject {
    
    class func sharedInstance() -> DataHandler {
        // structure used to test whether the block has completed or not
        var p: Int = 0
        // initialize sharedObject as nil (first call only)
        var _sharedObject: DataHandler? = nil
        // executes a block object once and only once for the lifetime of an application
        if (p == 0) {
            /* TODO: move below code to a static variable initializer (dispatch_once is deprecated) */
            _sharedObject = DataHandler.init()
        }
        p = 1
        // returns the same object each time
        return _sharedObject!
    }
    func saveUsersInCoredata(arrUserList: UserList) {
        
        // 1
        let managedContext =
            DataHandler.sharedInstance().persistentContainer.viewContext
        
        // 2
        let entity =
        NSEntityDescription.entity(forEntityName: KEY.COREDATA.PERSON_ENTITY,
                                       in: managedContext)!
        
        let dataRecord = NSManagedObject(entity: entity,
                                       insertInto: managedContext)
        dataRecord.setValue(arrUserList.id, forKeyPath: "id")
        dataRecord.setValue(arrUserList.login, forKeyPath: "login")
        dataRecord.setValue(arrUserList.starredUrl, forKeyPath: "starredUrl")
        dataRecord.setValue(arrUserList.gravatarId, forKeyPath: "gravatarId")
        dataRecord.setValue(arrUserList.avatarUrl, forKeyPath: "avatarUrl")
        dataRecord.setValue(arrUserList.subscriptionsUrl, forKeyPath: "subscriptionsUrl")
        dataRecord.setValue(arrUserList.htmlUrl, forKeyPath: "htmlUrl")
        dataRecord.setValue(arrUserList.receivedEventsUrl, forKeyPath: "receivedEventsUrl")
        dataRecord.setValue(arrUserList.followingUrl, forKeyPath: "followingUrl")
        dataRecord.setValue(arrUserList.type, forKeyPath: "type")
        dataRecord.setValue(arrUserList.url, forKeyPath: "url")
        dataRecord.setValue(arrUserList.gistsUrl, forKeyPath: "gistsUrl")
        dataRecord.setValue(arrUserList.reposUrl, forKeyPath: "reposUrl")
        dataRecord.setValue(arrUserList.siteAdmin, forKeyPath: "siteAdmin")
        dataRecord.setValue(arrUserList.followersUrl, forKeyPath: "followersUrl")
        dataRecord.setValue(arrUserList.nodeId, forKeyPath: "nodeId")
        dataRecord.setValue(arrUserList.organizationsUrl, forKeyPath: "organizationsUrl")
        dataRecord.setValue(arrUserList.eventsUrl, forKeyPath: "eventsUrl")
        dataRecord.setValue(KEY.COREDATA.NO_NOTES_PATTERN, forKeyPath: "notes")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func ischeckRecordPresent(strLogin:String)-> Bool{
        
        let context = DataHandler.sharedInstance().persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: KEY.COREDATA.PERSON_ENTITY)
        let resultPredicate = NSPredicate(format: "login = %@", strLogin)
        fetchRequest.predicate = resultPredicate
        do
        {
            let test = try context.fetch(fetchRequest)
            if test.count == 1{
                return true
            }
            else{
                return false
            }
        }
        catch
        {
            print(error)
        }
        return false
    }
    
    func updateNotesforUser(strNotes:String,strLogin:String) -> Bool{
        
        let context = DataHandler.sharedInstance().persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: KEY.COREDATA.PERSON_ENTITY)
        let resultPredicate = NSPredicate(format: "login = %@", strLogin)
        fetchRequest.predicate = resultPredicate
        do
        {
            let test = try context.fetch(fetchRequest)
            let objectUpdate = test[0] as! NSManagedObject
            objectUpdate.setValue(strNotes, forKey:  "notes")
            
            do{
                try context.save()
                return true
            }
            catch
            {
                print(error)
                return false
            }
        }
        catch
        {
            print(error)
            return false
        }
        
    }
    
    func updateUserIfexistInDatabase(arrUserList:UserList ) {
        
        let context = DataHandler.sharedInstance().persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: KEY.COREDATA.PERSON_ENTITY)
        let resultPredicate = NSPredicate(format: "login = %@", arrUserList.login!)
        fetchRequest.predicate = resultPredicate
        do
        {
            let existUser = try context.fetch(fetchRequest)
            let dataRecord = existUser[0] as! NSManagedObject
            dataRecord.setValue(arrUserList.id, forKeyPath: "id")
            dataRecord.setValue(arrUserList.login, forKeyPath: "login")
            dataRecord.setValue(arrUserList.starredUrl, forKeyPath: "starredUrl")
            dataRecord.setValue(arrUserList.gravatarId, forKeyPath: "gravatarId")
            dataRecord.setValue(arrUserList.avatarUrl, forKeyPath: "avatarUrl")
            dataRecord.setValue(arrUserList.subscriptionsUrl, forKeyPath: "subscriptionsUrl")
            dataRecord.setValue(arrUserList.htmlUrl, forKeyPath: "htmlUrl")
            dataRecord.setValue(arrUserList.receivedEventsUrl, forKeyPath: "receivedEventsUrl")
            dataRecord.setValue(arrUserList.followingUrl, forKeyPath: "followingUrl")
            dataRecord.setValue(arrUserList.type, forKeyPath: "type")
            dataRecord.setValue(arrUserList.url, forKeyPath: "url")
            dataRecord.setValue(arrUserList.gistsUrl, forKeyPath: "gistsUrl")
            dataRecord.setValue(arrUserList.reposUrl, forKeyPath: "reposUrl")
            dataRecord.setValue(arrUserList.siteAdmin, forKeyPath: "siteAdmin")
            dataRecord.setValue(arrUserList.followersUrl, forKeyPath: "followersUrl")
            dataRecord.setValue(arrUserList.nodeId, forKeyPath: "nodeId")
            dataRecord.setValue(arrUserList.organizationsUrl, forKeyPath: "organizationsUrl")
            dataRecord.setValue(arrUserList.eventsUrl, forKeyPath: "eventsUrl")
            
            do{
                try context.save()
            }
            catch
            {
                print(error)
            }
        }
        catch
        {
            print(error)
        }
        
    }
    
    func getAllgitUser() -> [NSManagedObject] {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: KEY.COREDATA.PERSON_ENTITY)
        let helper =
        DataHandler.sharedInstance().persistentContainer.viewContext
        do {
            let results = try helper.fetch(fetchRequest) as? [NSManagedObject]
            return results!
        } catch {
            print("Failed to fetch data request.")
        }
        
        return[]

    }
    
    func getNotesforUser(strLogin:String) ->String{
        
        let context = DataHandler.sharedInstance().persistentContainer.viewContext
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName:KEY.COREDATA.PERSON_ENTITY)
        let predicate = NSPredicate(format: "login = %@", strLogin)
        fetchRequest.predicate = predicate
        do
        {
            let test = try context.fetch(fetchRequest)
            let objectUpdate = test[0] as! NSManagedObject
            return objectUpdate.value(forKey: "notes") as! String
        }
        catch
        {
            print(error)
            return " "
        }
        
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "TawkPractical")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
