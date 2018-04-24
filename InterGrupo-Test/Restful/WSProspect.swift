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
    
    static let managedContext = CoreDataManager.managedObjectContext
    
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
        let entity = NSEntityDescription.entity(forEntityName: "NewClient", in: managedContext)
        let newClient =  NewClient(entity: entity!, insertInto: managedContext)
        
        newClient.id = json["id"].string
        newClient.name = json["name"].string
        newClient.surname = json["surname"].string
        newClient.telephone = json["telephone"].string
        newClient.statusCd = json["statusCd"].int16Value
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print(error)
        }
    }
    
   static func getNewClientsFromDB() ->[NewClient]{
        var newClient = [NewClient]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"NewClient")
        do{
            newClient = try managedContext.fetch(request) as! [NewClient]
        }catch (let error){
            print("\n Error \(error.localizedDescription) \n")
        }
        return newClient
    }
    
   static func deleteDB(completion:()->(Void)){
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
    
    static func updateNewClient(id:String,name:String,lastName:String,telephone:String,completion:()->()){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"NewClient")
        request.predicate = NSPredicate(format: "id == %@", id)
        do{
            let edit = try managedContext.fetch(request) as! [NewClient]
            edit.first?.id = id
            edit.first?.name = name
            edit.first?.surname = lastName
            edit.first?.telephone = telephone
            edit.first?.update = true
            try managedContext.save()
            completion()
        }catch (let error){
            print("\n Error \(error.localizedDescription) \n")
        }
        
    }
    
    static func getNewClientUpdated(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"NewClient")
        request.predicate = NSPredicate(format: "update == %@", NSNumber(value: true))
        do{
            let edit = try managedContext.fetch(request) as! [NewClient]
            for clientUpdated in edit{
                let dict:[String:Any] = [
                    "name": clientUpdated.name!,
                    "surname":clientUpdated.surname!,
                    "id":clientUpdated.id!,
                    "telephone":clientUpdated.telephone!,
                    "statusCd":clientUpdated.statusCd
                ]
                
                print(JSON(dict))
            }
        }catch (let error){
            print("\n Error \(error.localizedDescription) \n")
        }
    }
    
}
