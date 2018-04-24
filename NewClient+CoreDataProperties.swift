//
//  NewClient+CoreDataProperties.swift
//  
//
//  Created by carlos pava on 23/04/18.
//
//

import Foundation
import CoreData


extension NewClient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewClient> {
        return NSFetchRequest<NewClient>(entityName: "NewClient")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var surname: String?
    @NSManaged public var telephone: String?
    @NSManaged public var update: Bool
    @NSManaged public var statusCd: Int16

}
