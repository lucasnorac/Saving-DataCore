//
//  Person+CoreDataProperties.swift
//  Saving DataCore
//
//  Created by Lucas Caron Albarello on 02/01/2018.
//  Copyright © 2018 Lucas Caron Albarello. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var nome: String?
    @NSManaged public var idade: Int16

}
