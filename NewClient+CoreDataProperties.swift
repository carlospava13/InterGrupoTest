//
//  NewClient+CoreDataProperties.swift
//  
//
//  Created by carlos pava on 21/04/18.
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
    @NSManaged public var schProspectIdentification: String?
    @NSManaged public var address: String?
    @NSManaged public var createdAt: String?
    @NSManaged public var updatedAt: String?
    @NSManaged public var statusCd: Int64
    @NSManaged public var zoneCode: String?
    @NSManaged public var neighborhoodCode: String?
    @NSManaged public var cityCode: String?
    @NSManaged public var sectionCode: String?
    @NSManaged public var roleId: Int64
    @NSManaged public var observation: String?
    @NSManaged public var disable: Bool
    @NSManaged public var visited: Bool
    @NSManaged public var callcenter: Bool
    @NSManaged public var acceptSearch: Bool
    @NSManaged public var campaignCode: String?

}
