//
//  WSProspect.swift
//  InterGrupo-Test
//
//  Created by carlos pava on 21/04/18.
//  Copyright © 2018 carlos pava. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import CoreData
class WSProspect {
    
    static func getLisProspect(token:String,completion:@escaping(_ error:NSError?)->()){
        
        Alamofire.request(urlBase + Constants.urlPropects, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["token":token]).responseJSON { (response) in
            switch response.result{
            case .success(let value):
                deleteDB {
                    if let arrayValue = value as? NSArray{
                        for prospect in arrayValue{
                            savePropectInCoreDate(json: JSON(prospect))
                        }
                    }
                }
                completion(nil)
                break
            case .failure(let error):
                completion(error as NSError)
                break
            }
        }
    }
    
    
    static func savePropectInCoreDate(json:JSON){
        let managedContext = CoreDataManager.managedObjectContext
        let entity = NSEntityDescription.entity(forEntityName: "NewClient", in: managedContext)
        let newClient =  NewClient(entity: entity!, insertInto: managedContext)
        newClient.address = json["address"].string
        newClient.name = json["name"].string
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print(error)
        }
    }
    
   static func getNewClientsFromDB() ->[NewClient]{
        var newClient = [NewClient]()
        let managedContext = CoreDataManager.managedObjectContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"NewClient")
        do{
            newClient = try managedContext.fetch(request) as! [NewClient]
        }catch (let error){
            print("\n Error \(error.localizedDescription) \n")
        }
        return newClient
    }
    
   static func deleteDB(completion:()->(Void)){
        let managedContext = CoreDataManager.managedObjectContext
        do{
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName:"NewClient")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            try managedContext.execute(deleteRequest)
            try managedContext.save()
            completion()
        }catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
}
