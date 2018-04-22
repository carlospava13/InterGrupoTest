//
//  NewClient+CoreDataProperties.swift
//  
//
//  Created by carlos pava on 22/04/18.
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
    @NSManaged public var roleId: Int64
    @NSManaged public var surname: String?
    @NSManaged public var telephone: String?
    @NSManaged public var update: Bool

}
