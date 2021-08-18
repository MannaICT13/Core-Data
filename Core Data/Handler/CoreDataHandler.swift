//
//  CoreDataHandler.swift
//  Core Data
//
//  Created by Sharetrip-iOS on 16/08/2021.
//

import Foundation
import CoreData
import UIKit

class CoreDataHandler{
    
    static let coreDataInstance = CoreDataHandler()
    
    
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveData(data : [String : String]){
        
        let person = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context) as! Person
        person.name = data["name"]
        person.address = data["address"]
        
       do {
        try context.save()
        
        } catch let err  {
            print(err.localizedDescription)
        }
        
        
    }
    
    
    
    
    func retriveData() -> [Person] {
        
        var person = [Person]()
      let fetchData = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do{
            
            person = try context.fetch(fetchData) as! [Person]
            
        }catch let err {
            print(err.localizedDescription)
        }
        
        
        
        return person
        
    }
    
    func deleteData(index : Int){
        
        let person = retriveData()
        
        let deleteObj = person[index] as NSManagedObject
       
        context.delete(deleteObj)
        do {
            try context.save()
        } catch let err {
            print(err.localizedDescription)
        }
        
        
        
    }
    
    func editData(data : [String : String],index : Int){
        
        let person = retriveData()
        
        person[index].name = data["name"]
        person[index].address = data["address"]
        
        do {
            try context.save()
        } catch let err {
            print(err.localizedDescription)
        }
        
        
        
        
    }
    
    
    
    
    
}
