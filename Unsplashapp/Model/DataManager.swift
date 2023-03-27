//
//  DataManager.swift
//  Unsplashapp
//
//  Created by Mamoudou Cisse on 3/23/23.
//

import Foundation
import UIKit
import CoreData
class DataManager:NSObject{
    var pageNum = 1
    var managedContext:NSManagedObjectContext!
    
    static let shared:DataManager={
        let instance = DataManager()
        return instance
    }()
    override init(){
        super.init()
        let appDelegate=UIApplication.shared.delegate as? AppDelegate
        self.managedContext=appDelegate?.persistentContainer.viewContext
    }
    
    func save(id:Int){
        let entity=NSEntityDescription.entity(forEntityName: "Image", in: self.managedContext)
        let review = NSManagedObject.init(entity: entity!, insertInto: self.managedContext) as! Image
        review.setValue(id, forKey: "id")
        do{
            try self.managedContext.save()
        } catch {
            let nserror=error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func check(id:Int)->Bool{
        let entity=NSFetchRequest<Image>(entityName: "Image")
        entity.predicate = NSPredicate(format: "id == \(id)")
        do{
            if (try managedContext.fetch(entity).first != nil){
                return true
            }
        }
        catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return false
    }
    func delete(id:Int){
        let entity = NSFetchRequest<NSFetchRequestResult>(entityName:"Image")
        do{
            let result = try self.managedContext.fetch(entity)
            for obj in result{
                let r:NSManagedObject = (obj as? NSManagedObject)!
                let existing:Int64 = (r.value(forKey: "id") as? Int64)!
                if id == existing{
                    self.managedContext.delete(r)
                }
            }
        }
        catch{
            print("Fetching data Failed in delete")
        }
        do{
            try self.managedContext.save()
        }
        catch{
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror),\(nserror.userInfo)")
        }
    }
}

